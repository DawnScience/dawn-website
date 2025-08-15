#!/usr/bin/env bash
# script to create an installer package from a zipped product archive
# it signs the executable content, the installer package and notarizes then staples it

# requires CODESIGN_HASH, CODESIGN_INSTALLER_HASH, DEV_TEAM_ID, NOTARY_APPLE_ID, NOTARY_PASSWORD (may be defined in envs.txt)
SCR_DIR=$(dirname -- "${BASH_SOURCE[0]}")

ENVS_DEF=$SCR_DIR/envs.txt
if [ -f "$ENVS_DEF" ]; then
  source "$ENVS_DEF"
else
  echo "Warning: $ENVS_DEF is missing"
fi

if [ -z "$CODESIGN_HASH" ]; then
  echo "CODESIGN_HASH must be defined"
  exit 1
fi

if [ -z "$CODESIGN_INSTALLER_HASH" ]; then
  echo "CODESIGN_INSTALLER_HASH must be defined"
  exit 1
fi

if [ -z "$DEV_TEAM_ID" ]; then
  echo "DEV_TEAM_ID must be defined"
  exit 1
fi

if [ -z "$NOTARY_APPLE_ID" ] || [ -z "$NOTARY_PASSWORD" ]; then
  echo "NOTARY_APPLE_ID and NOTARY_PASSWORD must be defined"
  exit 1
fi
NOTARY_CREDS=(--apple-id "$NOTARY_APPLE_ID" --password "$NOTARY_PASSWORD" --team-id "$DEV_TEAM_ID")

if [ $# -lt 1 ]; then
  echo "Missing argument"
  exit 1
fi

INPUT_FILE=$1
ARCHIVE_DIR=${TMPDIR:-/tmp}


INPUT_BASE=$(basename "$INPUT_FILE")
if [[ ! $INPUT_BASE =~ zip$ ]]; then
  echo "Input must be a zip archive"
  exit 1
fi

# example DawnDiamond-2.38.0.v20250611-1505-macosx.aarch64.zip
ZIP_HEAD=${INPUT_BASE%.zip}
PKG_NAME=$ZIP_HEAD.pkg
ARCH=${ZIP_HEAD##*macosx.}
ZIP_LEAD=${ZIP_HEAD#-}
VERSION=${ZIP_LEAD%%.v*}
echo "$ZIP_HEAD is version $VERSION with arch $ARCH"
UNZIPPED_DIR=$ARCHIVE_DIR/tmp-dawn-$ARCH
echo "$UNZIPPED_DIR"

CLEAN_SUBDIR="${ARCHIVE_DIR}/tmp-unzipped-jar"

# Need to use SDK 10.9+ (2025/7) to pass notarization, see https://github.com/jnr/jffi/issues/123
# and fix in https://github.com/OpenRefine/OpenRefine/pull/5456
LIBJFFI=libjffi-1.2.jnilib
LIBJFFI_LOC="$SCR_DIR/$LIBJFFI"
if [ ! -f "$LIBJFFI_LOC" ]; then
  echo "$LIBJFFI_LOC is missing"
  exit 1
fi

DIST_XML="$SCR_DIR/dist-$ARCH.xml"
if [ ! -f "$DIST_XML" ]; then
  echo "$DIST_XML is missing"
  exit 1
fi


# entitlements required for JVM
JVM_ENTITLE=$SCR_DIR/entitlements.plist
if [ ! -f "$JVM_ENTITLE" ]; then
  echo "$JVM_ENTITLE is missing"
  exit 1
fi

if [ -d "$UNZIPPED_DIR" ]; then
  rm -rf "$UNZIPPED_DIR"
fi

unzip -q "$INPUT_FILE" -d "$UNZIPPED_DIR"

# sign native libraries
ALL_DYLIB=$(find "$UNZIPPED_DIR" -name \*jnilib -o -name \*dylib -o -name eclipse\*so | grep -v openjdk)
for d in $ALL_DYLIB; do
  codesign -s "$CODESIGN_HASH" -f --timestamp -o runtime "$d"
done

# re-sign JVM libraries
ALL_JVM_DYLIB=$(find "$UNZIPPED_DIR" -name \*dylib | grep openjdk)
for d in $ALL_JVM_DYLIB; do
  codesign -s "$CODESIGN_HASH" -f --timestamp -o runtime --entitlements "$JVM_ENTITLE" "$d"
done

# sign libraries embedded in jars
DYLIB_JARS=('com.sun.jna_*jar' 'org.jogamp.jogl.natives-macosx*jar'  'jython.jar')
for d in "${DYLIB_JARS[@]}"; do
  rm -rf "$CLEAN_SUBDIR"
  mkdir -p "$CLEAN_SUBDIR"
  pushd "$CLEAN_SUBDIR" || exit
  i=0
  ALL_JAR_CONTENT=$(find "$UNZIPPED_DIR" -name "$d")
  for j in $ALL_JAR_CONTENT; do
    unzip "$j" '*jnilib' '*dylib' -d $i
    pushd $((i++)) || exit
    # Fix libjffi issue
    find . -name $LIBJFFI -exec cp "$LIBJFFI_LOC" {} \;
    find . -type f -exec codesign -s "$CODESIGN_HASH" -f --timestamp -o runtime {} \;
    find . -type f > signed_files.lis
    jar -v -u -f "$j" @signed_files.lis
    popd || exit
  done
  popd || exit
done
rm -rf "$CLEAN_SUBDIR"

# entitlements required for main executable too
codesign -s "$CODESIGN_HASH" -f --timestamp -o runtime --entitlements "$JVM_ENTITLE" "${UNZIPPED_DIR}/Dawn.app/Contents/MacOS/dawn"

pkgbuild --install-location /Applications --component "${UNZIPPED_DIR}/Dawn.app" "dawn-$ARCH.pkg"

productbuild --sign "$CODESIGN_INSTALLER_HASH" --timestamp --resources resource_root --version "$VERSION" --distribution  "$PKG_NAME"

# notarize and staple
xcrun notarytool submit "$PKG_NAME" "${NOTARY_CREDS[@]}" --wait

xcrun stapler staple "$PKG_NAME"
