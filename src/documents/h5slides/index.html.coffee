---
title: 'h5slides'
name: 'h5slides'
linkTitle: 'h5slides'
pageOrder: 3
layout: 'h5slides'
tags: ['navmenu']
---

# Chose template style
section class:'slides layout-regular template-default', ->
  # Search document
  @getCollection('h5slides').toJSON().forEach (page) =>
    additionalClass = page.additionalClass or ''
    article class:additionalClass, ->
      text page.contentRenderedWithoutLayouts if page.contentRenderedWithoutLayouts
