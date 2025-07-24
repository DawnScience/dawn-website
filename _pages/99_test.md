---
layout: page
title: Test Jekyll plugins
permalink: /test/
---

{% for repository in site.github.public_repositories %}
  * [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}


Latest release is at {% site.github.releases_url %}

Latest release is {% site.github.latest_release.tag_name | remove_first: "v" %}


{% for asset in site.github.latest_release.assets %}
  * [{{ asset.name }}]({{ asset.browser_download_url }})
{% endfor %}



