---
layout: default
title: talks
rank: 3
---

## Selected Talks

<ul>
{% for talk in site.data.talks.selected %}
    {% if talk.url %}
    <li><a href="{{ site.url }}/documents/talks/{{ talk.url }}">{{ talk.title }}.</a><br/>
    {% else %}
    <li><em>{{ talk.title }}</em>.<br/>
    {% endif %}
    {{ talk.at }}, {{ talk.where }}, {{ talk.date }}.<br/>
    {{ talk.note }}
    </li>
{% endfor %}
</ul>

## All Talks (since 2001)
