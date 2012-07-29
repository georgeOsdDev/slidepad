---
title: 'big'
name: 'big'
linkTitle: 'big'
pageOrder: 2
layout: 'big'
tags: ['navmenu']
---
@getCollection('big').toJSON().forEach (page) =>
  div ->
    text page.contentRenderedWithoutLayouts if page.contentRenderedWithoutLayouts
