---
layout: default
title: research
rank: 1
---

## Overview

My research activities address **software engineering** with issues related to
distribution, composition, interaction, and a specific focus on behavioural descriptions.
Behavioural descriptions are often found under different names such as
behavioural interfaces, service conversations, or business processes.
{: .text-justify}

I am also particularly interested in the use and the integration of **formal methods** within the software development
processes.
This includes activities such as design, verification, software adaptation, automatic composition, and testing.
The objective is twofold:
first, to increase the confidence one may have in a software system and,
second, to foster automation and tool-support of the development processes.
{: .text-justify}

Applicative domains are important in my work,
which I apply to component and services frameworks and to business models and processes.
{: .text-justify}

## Publications

<div class="btn-group" role="group" aria-label="publication databases">
    {% for db in site.data.research.databases %}
    <button type="button" class="btn btn-default"><a href="{{ db.url }}">{{ db.name }}</a></button>
    {% endfor %}
</div>

{% include publications.html %}
