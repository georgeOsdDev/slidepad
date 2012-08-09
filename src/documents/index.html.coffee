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
        Once You write document in markdown syntax, it becomes HTML5 Slides.
      """
    br ->
    a href:"https://github.com/georgeOsdDev/slidepad", class:"btn btn-primary btn-large", target:"_blank", ->
      text "View project on GitHub"

    # AddThis Button  http://www.addthis.com/
    div id:"social-buttons",class:"addthis_toolbox addthis_default_style",->
      a class:"addthis_button_preferred_1"
      a class:"addthis_button_preferred_2"
      a class:"addthis_button_preferred_3"
      a class:"addthis_button_preferred_9"
      a class:"addthis_button_preferred_10"
      a class:"addthis_button_preferred_11"
      a class:"addthis_button_compact"
      script """
        var addthis_config = {'data_track_addressbar':true};
        """
      script type:"text/javascript",src:"http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f6378c46f6668f9"
    # AddThis Button END


  div '.marketing', ->
    h1 "Demos"
    p '.marketing-byline', ->
      text "Check out Demo presentations below."
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
      text "check licenses of them and how to use."      
    div '.row', ->
      div '.span6', ->
        h2 "Docpad"
        p """
          The main framework of slidepad.
          Docpad generate a Server, perse markdown, create view.
          Slidepad also use many plugins of Docpad <br>
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
            text "Getting Started"
          text "is based on Twitter-Bootstrap."
        a href:"http://twitter.github.com/bootstrap/", target:"_blank", ->
          text "http://twitter.github.com/bootstrap/"

    hr class:'soften-nomargin'

    div '.row', ->
      div '.span3', ->
        h2 "Big"
        p """
          Presentation software for busy busy hackers as big as it can be no config.
        """
        a href:"https://github.com/tmcw/big/", target:"_blank", ->
          text "https://github.com/tmcw/big/"
      div '.span3', ->
        h2 "deck.js"
        p """
          A JavaScript library for building modern HTML presentations.
        """
        br ->
        a href:"http://imakewebthings.com/deck.js/", target:"_blank", ->
          text "http://imakewebthings.com/deck.js/"
      div '.span3', ->
        h2 "HTML5Slides"
        p "A very simple Google HTML5 slide template By Luke Mahé and Marcin Wichary."
        a href:"http://code.google.com/p/html5slides/", target:"_blank", ->
          text "http://code.google.com/p/html5slides/"
      div '.span3', ->
        h2 "impress.js"
        p """
          Presentation framework based on the power of
          CSS3 transforms and transitions in modern browsers.
        """
        a href:"https://github.com/bartaz/impress.js/", target:"_blank", ->
          text "https://github.com/bartaz/impress.js/"
