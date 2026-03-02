---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

---
<div class="container pt-3">
    <div class="row">
        <div class="col-8">
            <h1>My-Azure</h1>
            <p>My-Azure is a PowerShell module to help with deployment of Azure Resource Manager Templates. Currently, My-Azure is focused on supporting deployment of infrastructure items like virutal machines for use in creating testing labs. In addition, this module streamlines activities like starting the machines within a specific resource group and some other various convenience activities.</p>
        </div>
        <div class="col-4">
            <ul class="list-group">
            {% assign sorted_posts = site.posts | sort: "title" %}
            {% for post in sorted_posts %}
                <li class="list-group-item"><a class="list-group-item-action" href="{{ post.url | relative_url }}">{{ post.title | default: post.name }}</a></li>
            {% endfor %}
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col">&nbsp;</div>
        <div class="col">
            <a href="{{ './Release%20Notes' | relative_url }}">Release Notes</a>
        </div>
        <div class="col">
            <a href="{{ './README' | relative_url }}">README</a>
        </div>
        <div class="col">&nbsp;</div>
    </div>
</div>