---
layout: 'page'
title: 'Home'
style: 'bootstrap'
---
section id:'content', class:'content', ->
  div class:'hero-unit', ->
    h1 "Welcome to Slidepad!"
    p ->
      text """
        Slidepad makes it easy to create HTML5 slides with major HTML5 slide templates and Docpad server.<br>
        Once You write something in markdown syntax, it becomes HTML5 Slides.
      """
  div '.marketing', ->
    h1 "Demos"
    p '.marketing-byline', ->
      text "Check out Demo presentation below."
    ul class:'thumbnails example-sites', ->
      li '.span3', ->
        a '.thumbnail', href:'/big', target:'_blank', ->
          img src:'/image/demo-big.png', alt:"Big"
          text "Big"
      li '.span3', ->
        a '.thumbnail', href:'/deck.js', target:'_blank', ->
          img src:'/image/demo-deck.png', alt:"deck.js"
          text "deck.js"
      li '.span3', ->
        a '.thumbnail', href:'/h5slides', target:'_blank', ->
          img src:'/image/demo-h5slides.png', alt:"HTML5Slides"
          text "HTML5Slides"
      li '.span3', ->
        a '.thumbnail', href:'/impress.js', target:'_blank', ->
          img src:'/image/demo-impress.png', alt:"impress.js"
          text "impress.js"


  hr class:'soften'

  div '.marketing', ->
    h1 "Dependencies"
    p '.marketing-byline', ->
      text "Slidepad directry depend on these libraries."
      text "check there licenses and how to use."      
    div '.row', ->
      div '.span6', ->
        h2 "Docpad"
        p """
          The main framework of SlideInitilizer.
          Docpad generatea Server, perse markdown, create view.
          Of course we use many plugins of Docpad <br>
          (e.g. coffeekup)
        """
        a href:"https://github.com/bevry/docpad", target:"_blank", ->
          text "https://github.com/bevry/docpad"
      div '.span6', ->
        h2 "Twitter Bootstrap"
        p ->
          text """
            Simple and flexible HTML, CSS, and Javascript for popular user interface components
            and interactions as you know.<br>
            This page and 
          """
          a href:"/pages/start", ->
            text "Get Started"
          text "is based on Twitter-Bootstrap."
        a href:"http://twitter.github.com/bootstrap/", target:"_blank", ->
          text "http://twitter.github.com/bootstrap/"

    hr class:'soften-nomargin'

    div '.row', ->
      div '.span3', ->
        h2 "Big"
        p """
          Big is Presentation software for busy busy hackers as big as it can be no config.
        """
        a href:"https://github.com/tmcw/big/", target:"_blank", ->
          text "https://github.com/tmcw/big/"
      div '.span3', ->
        h2 "deck.js"
        p """
          A JavaScript library for building modern HTML presentations.
        """
        a href:"http://imakewebthings.com/deck.js/", target:"_blank", ->
          text "http://imakewebthings.com/deck.js/"
      div '.span3', ->
        h2 "HTML5Slides"
        p "A Google HTML5 slide template By Luke Mahé and Marcin Wichary."
        a href:"http://code.google.com/p/html5slides/", target:"_blank", ->
          text "http://code.google.com/p/html5slides/"
      div '.span3', ->
        h2 "impress.js"
        p """
          It's a presentation framework based on the power of
          CSS3 transforms and transitions in modern browsers and inspired by the idea behind prezi.com.
        """
        a href:"https://github.com/bartaz/impress.js/", target:"_blank", ->
          text "https://github.com/bartaz/impress.js/"
