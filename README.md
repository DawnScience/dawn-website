# DAWN Public Website #
This repository contains the source code, content, and provides the hosting for the [DAWN public website](http://dawnsci.org). Created by [David Taylor](mailto:david@taylorhq.com)

For development this was accessible at [dawn.taylorhq.co.uk](http://dawn.taylorhq.co.uk). Once ready for production, it has been moved to the dawnsci.org domain following the instructions [here](https://help.github.com/articles/using-a-custom-domain-with-github-pages/). 

## Architecture ##
The website uses the open source [Jekyll](https://jekyllrb.com/) static site builder. GitHub provide a build system for their (somewhat restricted) distribution of Jekyll, called [github-pages](https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/).

## Making Changes ##
Anything in the default branch (gh-pages) will be served on the website. To make changes without affecting the production site, make sure you use a separate branch. Sometimes it can take a couple of minutes for GitHub to rebuild the site after any changes are made (you will also need to empty your browser's cache).

To make simple changes to the content, you can use the online GitHub editor. Just browse the [source code](https://github.com/DawnScience/dawn-website) and hit `edit` or `new file` to use the online editor. You can also clone the repository in the traditional way, and make changes using your favorite text editor.

## Markdown ##
Jekyll uses [markdown](https://en.wikipedia.org/wiki/Markdown) to make writing rich content in a text editor easy. You can just write in plain text, but for rich styling, an overview of the syntax can be found [here](https://gist.github.com/jonschlinkert/5854601).

## Media/Assets/TOC ##
#### YouTube ####
For YouTube video embeds, use the provided template by typing:
```
{% include video.html url='https://www.youtube.com/embed/zdIMHYyqdcQ?list=PLBXR5FtaBSTT7DXBx6p0v9u8fwQTwlPFa' %}
```
Replacing the URL with the embed url of the video
#### Images ####
Images and other files should be committed into the `/assets` directory. To embed an image, use the syntax:
```
![alt text](/assets/my_image.png "Mouseover Text")
```
#### Table of Contents
To add an automatically generated table of contents (based on heading levels), type
```
Unordered Table of Contents:
* TOC
{:toc}

Ordered Table of Contents:
1. TOC
{:toc}
```

## Edit/Add Content ##
There are two types of content on the website. **Pages** and **Posts**. **Pages** are displayed in the menu on the left, while **Posts** are entries in the "News" section. **Pages** are stored in the `_pages` directory, while **Posts** are stored in the `_posts` directory.




#### Pages ###
Pages do not have a fixed file name format. However, they are loaded into the menu in alphabetical order, so it is sensible to follow the format
```
##_page_name.md
```
where `##` is a number with leading zero. Sub-Pages should follow the format
```
##.%%_page_name.md
```
where `%%` is a second number definining the page's position in the sub menu.

The file extension `.md` indicates a markdown file. You can also use `html` files, but for normal content `.md` is easier to work with.

At the top of every file there **must** be some "YAML Front Matter". This contains meta information about the page. It it delimeted by three hyphens `---` above and below, and follows a `key: value` format (remember the space). Pages must provide values for `title` and `permalink`. For example:
```
---
title: Contact Us
permalink: /about/contact-us/
---
```
- `title:` is displayed in the menu, and at the top of the page.
- `permalink:` is the URL of the page. Must be unique, no more than two levels, and any parents must have existing pages (in this case, the `about` page).

Underneath the front matter, the content for the page should be written in markdown format.

#### Posts ###
Posts must follow the defined file name format 
```
YEAR-MONTH-DAY-title.md
```
where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit numbers.

The file extension `.md` indicates a markdown file. You can also use `html` files, but for normal content `.md` is easier to work with.

At the top of every file there **must** be some "YAML Front Matter". This contains meta information about the page. It it delimeted by three hyphens `---` above and below, and follows a `key: value` format (remember the space). Posts must provide values for, `title` only. For example, a file `2026-08-12-dawn_10_release.md` could have front matter:
```
---
title: DAWN 10.0 Release
---
```
- `title:` is displayed in the menu, and at the top of the page.

Underneath the front matter, the content for the post should be written in markdown format.

The most recent **post** will be displayed on the home page. Other posts are visible in the list on the `/news/` page.

## Local Testing ##
To preview your changes locally before deploying to the production website you need to run the Jekyll Ruby gem. Instructions to do this can be found [here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/). A [Vagrant](https://www.vagrantup.com/) virtual machine definition is included in this repository to avoid the need to install Ruby on your development machine. 

#### Starting the Vagrant virtual machine: ###
1. [Download](https://www.vagrantup.com/downloads.html) and install Vagrant. It is available for most operating systems. The installer will prompt you to install virtualbox.
2. Clone this git repo to a local folder
```
git clone https://github.com/DawnScience/dawn-website.git dawn_website
```
3. Change directory to the local folder
```
cd dawn_website
```
4. Start the vagrant virtual machine. 
``` 
vagrant up
```
5. Get a cup of tea while you wait. This command will take a long time the first time you run it, as it needs to download a linux virtual machine image and install all necessary dependencies. 
6. Once it's finished, go to a web browser and visit `http://localhost:8080`. You should see the website

#### Checking the Jekyll log ###
Go back to your terminal (inside the repo directory) and type:
```
vagrant ssh
less -S +F ~/jekyll.log
```
To stop looking at the log press <kbd>ctrl</kbd>+<kbd>c</kbd>, type `:q`, then type `exit`<kbd>enter</kbd>

#### Rebooting Vagrant virtual machine ###
This is useful if you update the _config.yml file, or the Jekyll compiler crashes:

Go back to your terminal (inside the repo directory) and type:
```
vagrant reload
```
#### Stopping the Vagrant virtual machine ###
Go back to your terminal (inside the repo directory) and type:
```
vagrant halt
```
To completely destroy the virtual machine image, use
```
vagrant destroy
```
This will not delete any of the source code or content. If you do this, you will have to do a full re-install when you next do `vagrant up`
## It's Broken!
Everything is in GIT - just revert the change that you made
