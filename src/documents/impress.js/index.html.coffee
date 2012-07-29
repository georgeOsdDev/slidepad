---
title: 'impress.js'
name: 'impress.js'
linkTitle: 'impress.js'
pageOrder: 5
layout: 'impress'
tags: ['navmenu']
---
# Chose template style
div id:'impress', ->
  # Search document
  @getCollection('impress').toJSON().forEach (page) =>
    sectionId = page.sectionId or ''
    additionalClass = page.additionalClass or 'step'
    div
      class:additionalClass, 
      id:sectionId,
      'data-x':page.datax if page.datax,
      'data-y':page.datay if page.datay,
      'data-z':page.dataz if page.datay,
      'data-rotate':page.datarotate if page.datarotate,
      'data-rotate-x':page.datarotatex if page.datarotatex,
      'data-rotate-y':page.datarotatey if page.datarotatey,
      'data-rotate-z':page.datarotatez if page.datarotatez,
      'data-scale':page.datascale if page.datascale,
      ->
        text page.contentRenderedWithoutLayouts if page.contentRenderedWithoutLayouts

  div '.step', id:'overview', 'data-x':'3000', 'data-y':'1500', 'data-scale':'10'

div '.hint', ->
  p "Use a spacebar or arrow keys to navigate"

script """
  if ('ontouchstart' in document.documentElement) { 
    document.querySelector(".hint").innerHTML = '<p>Tap on the left or right to navigate</p>';
  }
"""