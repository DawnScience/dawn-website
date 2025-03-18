---
layout: page
title: Download DAWN
permalink: /downloads/
---

### DAWN

DAWN can be downloaded using the links below. To install:

1. Choose the correct link for your operating system and download the file containing Dawn.

2. The installation depends on the platform you are running:

    * Linux: extract the zip to where you would like to install Dawn
    * Windows installer: run the installer and follow the instructions (recommended)
    * Windows zipfile: unzip the file, preferably in a folder at the drive root level (e.g. C:\\)
    * macOS: from the Downloads, right-click and open the pkg file, click on open on the warning dialog and follow the instructions

3. Once extracted Dawn can be started with the 'dawn' executable:

    * Linux: in a terminal, change directory to the one containing Dawn and use `$ ./dawn`;
    or use a file manager and navigate to the installation directory and double-click `dawn`
    * Windows installer: open the Start menu &rarr; All Programs &rarr; DAWN
    * Windows zipfile: double-click the dawn.exe where it was unzipped
    * macOS: use Launchpad, Spotlight, Finder etc to launch Dawn or from a terminal, use `$ /Applications/Dawn.app/Contents/MacOS/dawn`
    or `$ ~/Applications/Dawn.app/Contents/MacOS/dawn` depending on where you installed it

<script>
	function showHide(elementId){
		var element = document.getElementById(elementId);
		if(element.style.display == 'none'){
			element.style.display = 'block';
		} else {
			element.style.display = 'none';
		}
	}

	async function updateDownloadLinks() {
			const response = await fetch('https://api.github.com/repos/DawnScience/dawn-website/releases/latest');
			const data = await response.json();
			const assets = data.assets;

			const links = {
					'linux.aarch64.zip': 'linuxAarch64Link',
					'linux.x86_64.zip': 'linuxX86Link',
					'macosx.x86_64.pkg': 'macosxX86Link',
					'macosx.aarch64.pkg': 'macosxAarch64Link',
					'win32.x86_64-inst.exe': 'win32InstLink',
					'win32.x86_64.zip': 'win32ZipLink'
			};

			assets.forEach((asset) => {
				const fileName = asset.name;
				for (const [key, value] of Object.entries(links)) {
					if (fileName.endsWith(key)) {
						document.getElementById(value).href = asset.browser_download_url;
					}
				}
			});
	}
	document.addEventListener('DOMContentLoaded', updateDownloadLinks);

</script>
<div class="row center">
	<a id="linuxX86Link" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		Linux x86_64<i class="material-icons right">&#xE2C4;</i>
	</a>
	<button type="button" class="btn-large waves-effect" onclick="showHide('winExeOrZip')">
		Windows x86_64<i class="material-icons right">&#xE2C4;</i>
	</button>
	<a id="macosxX86Link" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		macOS x86_64<i class="material-icons right">&#xE2C4;</i>
	</a>
</div>

<div id="winExeOrZip" class="row center" style="display: none">
	<a id="win32InstLink" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		EXE<i class="material-icons right">&#xE2C4;</i>
	</a>
	<a id="win32ZipLink" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		ZIP<i class="material-icons right">&#xE2C4;</i>
	</a>
</div>

<div class="row center">
	<a id="linuxAarch64Link" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		Linux aarch64<i class="material-icons right">&#xE2C4;</i>
	</a>
	<a id="macosxAarch64Link" href="#" class="btn-large waves-effect" onclick="trackOutboundLink(this.href); return false;">
		macOS aarch64<i class="material-icons right">&#xE2C4;</i>
	</a>
</div>

Older DAWN versions are available [here](https://github.com/DawnScience/dawn-website/releases/).

This version of DAWN is the "full" DAWN workbench, which comes with perspectives and bundles used at Diamond Light Source.

To find the DAWN version you are currently using, go to Help&rarr;About DAWN Science&rarr;Installation Details

##### Supported 64-bit Operating Systems

|               | Platform             | Support Details                                                          |
|---------------|----------------------|--------------------------------------------------------------------------|
| **Linux**     | RHEL 9               | Untested                                                                 |
|               | RHEL 8               | Supported (Diamond)                                                      |
|               | RHEL 7               | Supported (Diamond)                                                      |
|               | RHEL 6               | Not officially supported but should work                                 |
|               | Debian               | Not officially supported but should work                                 |
|               | Raspberry Pi OS      | Tested with known minor issues                                           |
|               | Others (inc. Ubuntu) | Not officially supported but used as development and testing platforms.  |
| **Windows**   | Windows 11           | Untested                                                                 |
|               | Windows 10           | Supported (Diamond)                                                      |
|               | Windows 7, 8         | Not officially supported but should work                                 |
| **macOS**     | 15.x                 | Untested                                                                 |
|               | 14.x                 | Supported (however, avoid 14.4 for aarch64, 14.4.1 or later is fine)     |
|               | 13.x                 | Supported                                                                |
|               | 12.x                 | Supported                                                                |
|               | 11.x                 | Supported                                                                |
|               | 10.9 to 10.15        | Supported (for x86_64 only)                                              |

