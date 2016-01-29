---
layout: default
title: publications
rank: 2
---

**this page is experimental and uses a bibtex file that is not up to date**

It may appear empty on `pascalpoizat.github.io`
since the GitHub Page workflow does not accept the jekyll-scholar gem.

{% assign max='now'|date:"%Y" %}
{% assign min=max|minus: 5 %}
{% assign smin=min|plus: "" %}

## Recent Publications [{{min}}..{{max}}]

{% bibliography -f poizat -q @*[year>={{smin}}] %}

## Journal Articles

{% bibliography -f poizat -q @article %}

## Book Chapters

{% bibliography -f poizat -q @inbook %}

## Conferences and Workshops

{% bibliography -f poizat -q @inproceedings %}

## Manuscripts

{% bibliography -f poizat -q @phdthesis %}
