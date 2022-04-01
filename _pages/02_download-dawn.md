---
layout: page
title: Download DAWN
permalink: /downloads/
---
### DAWN 2.25.0


DAWN can be downloaded using the links below. To install:

1. Choose the correct link for your operating system and download the file containing Dawn.
2. The installation depends on the platform you are running:
    * Linux: extract the zip to where you would like to install Dawn
    * Windows installer: run the installer and follow the instructions (recommended)
    * Windows zipfile: unzip the file, preferably in a folder at the drive root level (e.g. C:\\)
    * macOS: mount the dmg file and drag Dawn to the Applications folder.
3. Once extracted Dawn can be started with the 'dawn' executable:
    * Linux: dawn.sh
    * Windows installer: open the Start menu &rarr; All Programs &rarr; DAWN
    * Windows zipfile: double-click the dawn.exe where it was unzipped
    * macOS: use Launchpad, Spotlight, Finder etc to launch Dawn
	
<script>
	function showHide(elementId){
		var element = document.getElementById(elementId);
		if(element.style.display == 'none'){
			element.style.display = 'block';
		} else {
			element.style.display = 'none';
		}
	}
</script>
<div class="row center">
	<a href="https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-linux.x86_64.zip" class="btn-large waves-effect" onclick="trackOutboundLink('https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-linux.x86_64.zip'); return false;">
		Linux 64bit<i class="material-icons right">&#xE2C4;</i>
	</a>
	<button type="button" class="btn-large waves-effect" onclick="showHide('winExeOrZip')">
		Windows 64bit<i class="material-icons right">&#xE2C4;</i>
	</button>
	<a href="https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-macosx.x86_64.dmg" class="btn-large waves-effect" onclick="trackOutboundLink('https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-macosx.x86_64.dmg'); return false;">
		macOS 64bit<i class="material-icons right">&#xE2C4;</i>
	</a>
</div>

<div id="winExeOrZip" class="row center" style="display: none">
	<a href="https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-win32.x86_64-inst.exe" class="btn-large waves-effect" onclick="trackOutboundLink('https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-win32.x86_64-inst.exe'); return false;">
		EXE<i class="material-icons right">&#xE2C4;</i>
	</a>
	<a href="https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-win32.x86_64.zip" class="btn-large waves-effect" onclick="trackOutboundLink('https://alfred.diamond.ac.uk/DawnDiamond/2.25/downloads/builds-release/DawnDiamond-2.25.0.v20220331-0755-win32.x86_64.zip'); return false;">
		ZIP<i class="material-icons right">&#xE2C4;</i>
	</a>
</div>

Older DAWN versions are available [here](https://alfred.diamond.ac.uk/DawnDiamond/).

Development releases (nightly builds) can be downloaded [here](https://alfred.diamond.ac.uk/DawnDiamond/master/downloads/builds-snapshot/).

This version of DAWN is the "full" DAWN workbench, which comes with perspectives and bundles used at Diamond Light Source.

To find the DAWN version you are currently using, go to Help&rarr;About DAWN Science&rarr;Installation Details

##### Supported Operating Systems

|               | Platform             | Support Details                                                          |
|---------------|----------------------|--------------------------------------------------------------------------|
| **Linux**     | RHEL 8               | Known issues, not supported yet                                          |
|               | RHEL 7               | Supported (Diamond)                                                      |
|               | RHEL 6               | Not officially supported but should work                                 |
|               | RHEL 5               | Being phased out end 2013. Known issues but still runs.                  |
|               | Debian               | Not officially supported but should work                                 |
|               | Others (inc. Ubuntu) | Not officially supported but used as development and testing platforms.  |
| **Windows**   | Windows 11           | Untested                                                                 |
|               | Windows 10           | Supported (Diamond)                                                      |
|               | Windows 7, 8         | Not officially supported but should work                                 |
|               | Windows XP, Vista    | Not supported                                                            |
|               | Other                | Not supported (Windows 98/ME/NT known not to work, Vista normally is ok) |
| **macOS**     | 12.0                 | Known issues, not supported yet                                          |
|               | 11.x                 | Known issues, not supported yet                                          |
|               | 10.8 to 10.15        | Tested                                                                   |

