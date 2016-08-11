---
layout: page
title: Documentation
permalink: /documentation/
---

## Contents
{:.no_toc}
1. Will be replaced with the ToC, excluding the "Contents" header
{:toc}

### Introduction

These notes are designed to detail best practice in using the various APIs available in Dawn as a programmer. With Dawn one can either add new features using python scripts with pydev, using workflows or with Java in the form of osgi plugins. The python API and workflows are user level since any user may extend Dawn this way without changing Dawn. The Java programmer will normally need to contribute to the github repos and will need to rebuild Dawn before the feature is available in Dawn or will be using Dawn APIs in their own project, such as [GDA ](http://www.opengda.org/)for instance. This guide is designed for Java programmers and explains some of the APIs available and when to use them.  
  
If you are familiar with eclipse and buckminster, this quick start guide should get you up and running with developing DAWN. In order to push your changes, please complete a 'Pull Request' on github. There are four simple points to follow to get up and running:

##### 1. Eclipse and Buckminster

If not already installed you will need the [JDK ](http://www.oracle.com/technetwork/java/javase/downloads/index.html)installed. You will need to install a version of eclipse for '[RCP and RAP developers](https://eclipse.org/downloads/)' and also add the Buckminster update site, something like: http://download.eclipse.org/tools/buckminster/updates-4.3 depending on version. (It is not required to install git as you can develop using egit inside eclipse acceptably well.)  
Alternatively, you can Install an eclipse bundle put together at Diamond that comes with all the necessary plugins (eGit, Buckminster etc) which can be downloaded [here](http://www.opengda.org/downloads/eclipse/).

##### 2. Clean workspace

Create a folder to be the workspace. Inside this folder expand the most recent zip file from here: [http://www.opengda.org/buckminster/templates/](http://www.opengda.org/buckminster/templates/)

This ensures that the defaults and target are going to be the same for all developers of DAWN.

##### 3. CQuery

Open eclipse with the folder you created as the workspace folder. We are now going to run a Buckminster query to pull over all the DAWN source code. From the file menu in eclipse choose 

'Open a component query' and enter the URI http://www.opengda.org/buckminster/base/dawn-master.cquery. Then enter the 'eclipse.feature' of org.dawnsci.base.site. On the properties of the CQuery, change "download.location" to "public" and if you don't have ssh keys for github setup, set "github.authentication" to "anonymous"

Then press the 'Resolve and Materialize' button.

DAWN development environment will now materialize to your folder and a folder at the same level appended with '_git' for the git repos.

##### 4. Compile and Run

Please turn on 'Build Automatically' from the project menu. DAWN will now compile, don't worry if there seem to be errors at this stage. When we run the product these will resolve.

Go to the plugin 'org.dawnsci.product.plugin' and open the org.dawnsci.base.product. Start DAWN from the toolbar at the top which contains a 'Launch an Eclipse application in Debug mode' action.

Congratulations, you are now able to develop and debug DAWN. Happy hacking...

  

### Plotting

The plotting is a feature rich and elegant API which as well as plotting data can manage tools and selection regions. 

@Deprecated Do not use DataSetPlotter for plotting. This class has now been deprecated and it will not be supported after Raptor.

#### Getting started with IPlottingSystem

The plotting system in Dawn is encapsulated behind an interface (feature rich and well documented, see javadocs). This interface is called IPlottingSystem. If you are doing any plotting in Dawn, you should use this interface. For Dawn 1.0 and 1.1 the interface includes 1D and 2D plotting, multiple axes, multiple regions (replaces overlays in the old system), configuration of almost everything, real time / interactive plots, advanced histogramming etc. From Dawn Raptor onwards, 3D will be included. 

Unlike the plotting system in SDA, the default implementation of IPlottingSystem (known as 'Light Weight Plotting System') will pass over NX clients and other remote client technologies. In addition it manages the toolbar actions automatically (these can be manipulated in createPartControl of your part as well). Also it is no longer necessary to manage the low level drawing outside the plotting package for regions. A feature rich set of regions are provided in the API.