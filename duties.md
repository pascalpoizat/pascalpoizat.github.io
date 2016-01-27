---
layout: default
title: duties
rank: 5
---

## Currently

{% for category in site.data.duties.currently %}

### {{ category.name }}

<ul>
    {% for duty in category.values %}
    <li>{{ duty.period }} - {{ duty.name }}<br/>
    {{ duty.at }}
    </li>
    {% endfor %}
</ul>

{% endfor %}

## Before

{% for category in site.data.duties.before %}

### {{ category.name }}

<ul>
    {% for duty in category.values %}
    <li>{{ duty.period }} - {{ duty.name }}<br/>
    {{ duty.at }}
    </li>
    {% endfor %}
</ul>

{% endfor %}


