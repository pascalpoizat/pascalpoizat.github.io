---
layout: post
title: "Generating a Page using Personal Data"
date: 2016-01-27
categories: [jekyll, liquid, templates, yaml]
---

Static page generators such as [Jekyll](http://jekyllrb.com/) can
use data stored in files to produce the information contained into HTML pages.<br/>
We will have a look at this using a simple example.
{: .text-justify}

## The data files

The first step is to define the file(s) that will contain the information.
This can be either JSON, YAML, or CSV files.
For [my list of offices]({{site.url}}/offices/) I chose to use YAML files, but another part of my site,
the [list of talks]({{site.url}}/talks/), uses JSON files.
Data files have to be put in the `_data` directory of the Jekyll tree structure.
Sub-directories can be used to structure your set of data files. So here I put my data within `_data/offices`.
Further, we will have one file for the current offices, `currently.yml`,
and another file, `before.yml`, for the old ones. Here is the `currently.yml` one:
{: .text-justify}

{% highlight yaml %}
- name: Pedagogic
  values:

  - period: since 2012
    name: Director of 1st and 2nd year of Master in CS (Applied cursus, MIAGE)
    at: Paris Ouest University

- name: Scientific
  values:

  - period: since 2014
    name: Member of the Nat. Committee for Scientific Research | CoNRS Sect. 6
    at: CNRS

  - period: since 2014
    name: Member of the Laboratory Council | Conseil de Laboratoire
    at: LIP6 Laboratory

  - period: since 2013
    name: Member of the CS Advisory Council | CCD Sect. 27
    at: Paris Ouest University
{% endhighlight %}

You have a list of 2 items, each item containing a name (category) and a list of values,
with a value being a period, a name, and the location it took place
(see [here](https://fr.wikipedia.org/wiki/YAML) for information about the YAML format).
{: .text-justify}

## From data to HTML

To generate HTML information for this, one can create an HTML document, `offices.html`,
and use [Liquid templating](http://liquidmarkup.org/) to access the data.
To generate a list you simply have to type in `offices.html`:
{: .text-justify}

{% highlight liquid %}
{% raw %}
---
layout: default
title: offices
---
{% for category in site.data.offices.currently %}
<h3>{{ category.name }}</h3>
<ul>
    {% for office in category.values %}
    <li>{{ office.period }} - {{ office.name }}<br/>
    {{ office.at }}
    </li>
    {% endfor %}
</ul>
{% endfor %}
{% endraw %}
{% endhighlight %}

As you can see, to access the data in the file `_data/offices/currently.yml`, we refer to `site.data.offices.currently`.
This can be read as "the `currently` file that is in the `offices` subdirectory of the site data directory".
{: .text-justify}

For loops iterate over a list using some variable `v`.
{: .text-justify}

{% highlight liquid %}{% raw %}{% for v in list %}...{% endfor %}{% endraw %}{% endhighlight %}

To access to some attribute `a` of a variable `v`, we use double brackets and indexing.
{: .text-justify}

{% highlight liquid %}{% raw %}{{ v.a }}{% endraw %}{% endhighlight %}

The rest is self-explanatory if you know HTML.
{: .text-justify}

You can get more information on Liquid templating [here](http://jekyllrb.com/docs/datafiles/) and [here](http://liquidmarkup.org/).
{: .text-justify}

## Factorizing things

Now if you want to generate also the list of the old offices, you have to copy-paste the piece of code before,
and replace `site.data.offices.currently` by `site.data.offices.before`. Too bad.
A better way to do things is to define the code in terms of a variable `offices` as follows:
{: .text-justify}

{% highlight liquid %}
{% raw %}
{% for category in offices %}
<h3>{{ category.name }}</h3>
<ul>
    {% for office in category.values %}
    <li>{{ office.period }} - {{ office.name }}<br/>
    {{ office.at }}
    </li>
    {% endfor %}
</ul>
{% endfor %}
{% endraw %}
{% endhighlight %}

Then you put this piece of code, say `print_offices` within the Jekyll include directory, `_includes`.
In order to generate both list of offices you now simply have to write in `offices.html`:
{: .text-justify}

{% highlight liquid %}
{% raw %}
---
layout: default
title: offices
---
<h2>Currently</h2>

{% assign offices = site.data.offices.currently %}
{% include print_offices.html %}

<h2>Before</h2>

{% assign offices = site.data.offices.before %}
{% include print_offices.html %}
{% endraw %}
{% endhighlight %}

If you prefer to use Markdown, use instead a `offices.md` file with:
{: .text-justify}

{% highlight liquid %}
{% raw %}
---
layout: default
title: offices
---
## Currently

{% assign offices = site.data.offices.currently %}
{% include print_offices.html %}

## Before

{% assign offices = site.data.offices.before %}
{% include print_offices.html %}
{% endraw %}
{% endhighlight %}

## Factorizing things (revisited)

Indeed file inclusion supports parameters (see [here](http://jekyllrb.com/docs/templates/)).
You can add the parameter and its value to the import as follows:
{: .text-justify}

{% highlight liquid %}
{% raw %}
---
layout: default
title: offices
---
## Currently

{% include print_offices.html offices=site.data.offices.currently %}

## Before

{% include print_offices.html offices=site.data.offices.before %}
{% endraw %}
{% endhighlight %}

In the `print_offices.html` template that is in the `_includes` directory, you just have to prefix the name of the parameter with `include`:
{: .text-justify}

{% highlight liquid %}
{% raw %}
{% for category in include.offices %}
<h3>{{ category.name }}</h3>
<ul>
    {% for offices in category.values %}
    <li>{{ office.period }} - {{ office.name }}<br/>
    {{ office.at }}
    </li>
    {% endfor %}
</ul>
{% endfor %}
{% endraw %}
{% endhighlight %}


