---
layout: default
style: 'bootstrap'
---
div class:'navbar navbar-fixed-top', ->
  div '.navbar-inner', ->
    div '.container', ->
      a class:'brand', href:'/', ->
        text "slidepad"
      ul '.nav', ->
        @getCollection('navmenus').toJSON().forEach (page) =>
          li typeof:'sioc:Page', about:page.url, class:"#{'active' if @document.url is page.url}", ->
            a href:page.url ,property:'dc:title', ->
              text page.title
      a href:'https://github.com/georgeOsdDev', target:'_blank', ->
        img style:'position: absolute; top: 0; right: 0; border: 0;', src:  'https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png', alt:"Fork me on GitHub"

div '.container', ->
  text @content

  hr class:'soften-nomargin'

  footer id:'footer', ->
    p ->
      text "This website was created with"
      a href:'http://bevry.me', target:'_blank', title:'Visit Website', ->
        text 'Bevry'
      text "'s"
      a href:'https://github.com/bevry/docpad', target:'_blank', title:'Visit on GitHub', ->
        text 'DocPad'
      text " Powerd by "
      a href:'http://nodejs.org/', target:'_blank', title:'Node.js', ->
        text 'Node.js'
      br ->
      text "Slidepad is created and maintained by"
      a href:'http://about.me/takeharu.oshida', target:'_blank', title:'about me', ->
        text "Takeharu.Oshida"
    p ->
      "Last updated at #{@site.date.toISOString()}"

# Include scripts
text @getBlock('scripts').add([
  '/vendor/log.js'
  '/vendor/jquery.js'
  '/vendor/modernizr.js'
  '/vendor/prettify.js'
  '/scripts/script.js'
]).toHTML()
