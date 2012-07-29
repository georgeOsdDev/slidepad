---
title: 'deck.js'
name: 'deck.js'
linkTitle: 'deck.js'
pageOrder: 3
layout: 'deck'
tags: ['navmenu']
---

# Helper for nested section
hashedPages ={}
pages=[]
rendered = {}
renderChild = (page) ->
  page.child?.forEach (childId) =>
    childPage = hashedPages[childId]
    if not rendered[childPage.sectionId]
      section '.slide', id:"#{childPage.sectionId}", ->
        text childPage.contentRenderedWithoutLayouts
        renderChild(childPage)
      rendered[childPage.sectionId] = true

# Search document
@getCollection('deck').toJSON().forEach (page) =>
  pages.push(page) if page.contentRenderedWithoutLayouts
  hashedPages[page.sectionId] = page if page.contentRenderedWithoutLayouts

# render document
for page in pages
  if not rendered[page.sectionId]
    section '.slide', id:"#{page.sectionId}", ->
      text page.contentRenderedWithoutLayouts
      renderChild(page)
    rendered[page.sectionId] = true


# deck.navigation snippet
a '.deck-prev-link', href='#', title:'Previous', ->
  text "&#8592;"
a '.deck-next-link', href='#', title='Next', ->
  text "&#8594;"

# deck.status snippet
p '.deck-status', ->
  span class:'deck-status-current'
  text "/"
  span class:'deck-status-total'

  # add some style
  button value:'toggle-goto',name:'toggle-goto', onclick:"$.deck('toggleGoTo')"
  button value:'toggle-menu',name:'toggle-menu', onclick:"$.deck('toggleMenu')" 
  button value:'toggle-scale',name:'toggle-scale  ', onclick:"$.deck('toggleScale')" 


# deck.goto snippet
form '.goto-form', action:".", method:"get", ->
  label for:'goto-slide', ->
    text "Go to slide:"
  input type:'text', name:'slidenum', id:'goto-slide', list:'goto-datalist', ->
  datalist id:'goto-datalist'
  input type:'submit', value:'Go'

# deck.hash snippet
a '.deck-permalink', href:".", title:"Permalink to this slide", ->
  text "#"
  