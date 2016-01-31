---
layout: default
title: publications
rank: 2
---

**this page is experimental and uses a bibtex file that is not up to date**

{% assign max='now'|date:"%Y" %}
{% assign min=max|minus: 5 %}
{% assign smin=min|plus: "" %}

## Recent Publications [{{min}}..{{max}}]

{% bibliography -q @*[year>={{smin}}] %}

## Journal Articles

{% bibliography -q @article %}

## Book Chapters

{% bibliography -q @inbook %}

## Conferences and Workshops

{% bibliography -q @inproceedings %}

## Manuscripts

{% bibliography -q @phdthesis %}
