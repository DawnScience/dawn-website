---
layout: page
title: Download DAWN
permalink: /downloads/
---
### DAWN 2.5.0

DAWN can be downloaded using the links below. To install:

1. Choose the correct link for your operating system and download the file containing Dawn.
2. The installation depends on the platform you are running:
    * Linux: extract the zip to where you would like to install Dawn
    * Windows: run the Windows installer
    * macOS: 
        1. **Ensure that Java 8 is installed (full JDK)**
        2. Extract the zip file (this may have happened automatically)
        3. Move the entire folder to e.g. /Applications
        4. On Sierra (or newer), you will need to declare the app bundle safe by executing the following command from the terminal:
             `xattr -r -d com.apple.quarantine /path/to/Dawn.app`
3. Once extracted Dawn can be started with the 'dawn' executable (Linux: dawn.sh; Windows: dawn.exe; Mac: Dawn.app).

<div class="row center">
        <a href="http://opengda.org/DawnDiamond/2.5/downloads/builds-release/DawnDiamond-2.5.0.v20170612-1332-linux64.zip" class="btn-large waves-effect">
        	Linux 64bit<i class="material-icons right">&#xE2C4;</i>
        </a>
        <a href="http://opengda.org/DawnDiamond/2.5/downloads/builds-release/DawnDiamond-2.5.0.v20170612-1332-windows64.exe" class="btn-large waves-effect">
        	Windows 64bit<i class="material-icons right">&#xE2C4;</i>
        </a>
        <a href="http://opengda.org/DawnDiamond/2.5/downloads/builds-release/DawnDiamond-2.5.0.v20170612-1332-mac64.zip" class="btn-large waves-effect">
        	MacOS 64bit<i class="material-icons right">&#xE2C4;</i>
        </a>
</div>

If you are at Diamond Light Source this link is [faster](http://dawn.diamond.ac.uk/DawnDiamond/2.5/downloads/builds-release/)

Older DAWN versions available [here](http://opengda.org/DawnDiamond/).

This version of DAWN is the "full" DAWN workbench, which comes with perspectives and bundles used at Diamond Light Source.

To find the DAWN version you are currently using, go to Help->About DAWN Science->Installation Details

##### Supported Operating Systems

|               | Platform             | Support Details                                                          |
|---------------|----------------------|--------------------------------------------------------------------------|
| **Linux**     | RHEL 6               | Supported (Diamond)                                                      |
|               | RHEL 5               | Being phased out end 2013. Known issues but still runs.                  |
|               | Debian               | Not officially supported but should work                                 |
|               | Others (inc. Ubuntu) | Not officially supported but used as development and testing platforms.  |
| **Windows**   | Windows 10           | Supported (Diamond)                                                      |
|               | Windows 8            | Not officially supported                                                 |
|               | Windows 7            | Supported (Diamond)                                                      |
|               | Windows XP           | Not Supported                                                            |
|               | Other                | Not supported (Windows 98/ME/NT known not to work, Vista normally is ok) |
| **macOS**     | 10.8 to 10.12        | Beta version available. Would like to officially support eventually.     |

