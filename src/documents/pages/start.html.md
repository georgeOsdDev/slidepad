---
title: 'Getting Started'
name: 'Getting Started'
linkTitle: 'Getting Started'
pageOrder: 1
layout: 'page'
tags: ['navmenu']
---

# Getting Started

---

* [About](#10)
* [Install](#20)
* [Create Your Presentation](#30)
 * [Using Big](#31)
 * [Using deck.js](#32)
 * [Using html5slides](#33)
 * [Using impress.js](#34)

[日本語](/pages/start-ja)で表示する。

<hr id="10" class="soften">

# About
Slidepad is HTML slide generater based on [Docpad](https://github.com/bevry/docpad).
Slidepad converts markdown documents into cool HTML presentations.
You can chose presentation template from 
[Big](https://github.com/tmcw/big/)、[deck.js](http://imakewebthings.com/deck.js/)、[html5slides](http://code.google.com/p/html5slides/)、[impress.js](https://github.com/bartaz/impress.js/).

<hr id="20" class="soften">

# Install
Slidepad run on Node.js. So set up [Node.js](http://nodejs.org/) first of all.

__install docpad__

    npm install -g docpad

__clone the project__

    git clone http://github.com/georgeOsdDev/slidepad.git
    cd slidepad
    npm install

__generate server__

    docpad run

__or without docpad__

    node node_modules/docpad/bin/docpad-server

__check it out with modern browser__

http://localhost:9778

<hr id="30" class="soften">

# Create Your Presentation

Source documents must be saved as .html.md file like below. 
.html.md files are included into each index.html.coffee file. And then it was converted into index.html by docpad.

    / 
    └── src
        └── documents
            ├── big
            │   ├── big1.html.md
            │   ├── big2.html.md
            │   ├── ...
            │   ├── 
            │   └── index.html.coffee
            ├── deck.js
            │   ├── deck1.html.md
            │   ├── deck2.html.md
            │   ├── ...
            │   ├── 
            │   └── index.html.coffee
            ├── h5slides
            │   ├── h5slides1.html.md
            │   ├── h5slides2.html.md
            │   ├── ...
            │   ├── 
            │   └── index.html.coffee
            ├── impress.js
            │   ├── impress1.html.md
            │   ├── impress2.html.md
            │   ├── ...
            │   ├── 
            │   └── index.html.coffee
            ├── index.html.coffee
            ├── pages
            │   ├── start-ja.html.md
            │   └── start.html.md
            ├── scripts
            │   └── script.js.coffee
            └── styles
                └── style.css.styl


<hr id="31" class="soften">

## Using big

### Document
 Create documents like below.

__big1.html.md__

    ---
    pageOrder: 1
    tags: ['big']
    title: 'big1'
    ---
    Write something Here in markdown syntax

lines between --- are meta-data shoud be written in coffee-script syntax.
 
 * pageOrder: __（Required）__
  * this number become the order of presentation. 
 * tags　__（Required）__ must be contain 'big'
  * slidepad recognize it as big style. 
 * title:（Optional）
  * any title as you like.


### Conversion

One document become a __&lt;div&gt;__ element in index.html.
And [Big](https://github.com/tmcw/big/) recognize it one slide in a presentation

### Style
To apply other style, edit layout file.
__/src/documents/laout/default.html.coffee__ around L71

    switch @document.layout
      when 'big.html.coffee'
        link rel:'stylesheet', href:'/vendor/big/big.css', type:'text/css'
        script src:'/vendor/big/big.js'


### More infomation

[Big](https://github.com/tmcw/big/)

<hr id="32" class="soften">

## Using deck.js

### Document
 Create documents like below.

__deck2.html.md__

    ---
    pageOrder: 2
    tags: ['deck']
    sectionId:'deck2'
    child: ['deck3','deck4','deck5']
    title: 'deck2'
    ---
    Write something Here in markdown syntax

lines between --- are meta-data shoud be written in coffee-script syntax.
 
 * pageOrder: __（Required）__
  * this number become the order of presentation. 
 * tags　__（Required）__ must be contain 'deck'
  * slidepad recognize it as deck.js style. 
 * sectionId　__（Required）__ 
  * This arg become elementId in index.html. Some deck.js's extention needs elementId. 
 * child:（Optional）
  * If you want create nested section in presentation, write child section here. And it can be nested.
 * title:（Optional）
  * any title as you like.


### Conversion

One document become a __&lt;section&gt;__ element in index.html.
And [deck.js](http://imakewebthings.com/deck.js/) recognize it one slide in a presentation.

### Style
To apply other style, edit layout file.
__/src/documents/laout/default.html.coffee__ around L74〜L90

    when 'deck.html.coffee'
      text @getBlock('styles').add([
        '/vendor/deck/core/deck.core.css'
        # Chose extentions
        '/vendor/deck/extensions/goto/deck.goto.css'
        '/vendor/deck/extensions/menu/deck.menu.css'
        '/vendor/deck/extensions/navigation/deck.navigation.css'
        '/vendor/deck/extensions/status/deck.status.css'
        '/vendor/deck/extensions/hash/deck.hash.css'
        '/vendor/deck/extensions/scale/deck.scale.css'
        # Chose style
        '/vendor/deck/themes/style/swiss.css'
        # '/vendor/deck/themes/style/neon.css'
        # '/vendor/deck/themes/style/web-2.0.css'
        '/vendor/deck/themes/transition/horizontal-slide.css'
        # '/vendor/deck/themes/transition/vertical-slide.css'
        # '/vendor/deck/themes/transition/fade-slide.css'
      ]).toHTML()
      script src:'/vendor/deck/modernizr.custom.js'

### deck.js extention
All deck.js extentions are imported by default.
To apply them, edit index.html.coffee like below.

__/src/documents/deck/index.html.coffee__ around L37

    # deck.navigation snippet
    a '.deck-prev-link', href='#', title:'Previous', ->
      text "&#8592;"
    a '.deck-next-link', href='#', title='Next', ->
      text "&#8594;"

### More infomation

[deck.js doc](http://imakewebthings.com/deck.js/docs/)

<hr id="33" class="soften">

## Using html5slides

### Document
 Create documents like below.

__h5slides3.html.md__

    ---
    pageOrder: 3
    tags: ['h5slides']
    additionalClass:'build'
    title: 'h5slides2'
    ---
    Write something Here in markdown syntax

lines between --- are meta-data shoud be written in coffee-script syntax.
 
 * pageOrder: __（Required）__
  * this number become the order of presentation. 
 * tags　__（Required）__ must be contain 'big'
  * slidepad recognize it as big style. 
 * additionalClass:（Optional）
  * apply additional class, if you like.
 * title:（Optional）
  * any title as you like.


### Conversion

One document become a __&lt;article&gt;__ element in index.html.
And [html5slides](http://code.google.com/p/html5slides/) recognize it one slide in a presentation

### Style

To apply other style, edit layout file.
__/src/documents/h5slides/index.html.coffee__ L11

    section class:'slides layout-regular template-default', ->

### More infomation

[html5slides](http://code.google.com/p/html5slides/)

<hr id="34" class="soften">

## Using impress.js

### Document
 Create documents like below.

__impress4.html.md__

    ---
    pageOrder: 4
    tags: ['impress']
    sectionId:'source'
    title: 'impress4'
    datax: 6300
    datay: 2000
    datarotate: 20
    datascale: 4
    additonalClass : ""
    ---
    Write something Here in markdown syntax

lines between --- are meta-data shoud be written in coffee-script syntax.
 
 * pageOrder: __（Required）__
  * this number become the order of presentation. 
 * tags　__（Required）__ must be contain 'big'
  * slidepad recognize it as big style. 
 * sectionId: (Optional)
  * any id as you like to apply css.
 * additionalClass:（Optional）
  * apply additional class, if you like.
 * title:（Optional）
  * any title as you like.
 * these impress meta-data are anable to use (Optional)
  * datax: applyed as data-x
  * datay: applyed as data-y
  * dataz: applyed as data-z
  * datarotate: applyed as data-rotate
  * datarotatex: applyed as data-rotate-x
  * datarotatey: applyed as data-rotate-y
  * datarotatez: applyed as data-rotate-z
  * datascale: applyed as data-scale


### Conversion

One document become a __&lt;div&gt;__ element with meta-data attributes in index.html.
And [impress.js](https://github.com/bartaz/impress.js/) recognize it one slide in a presentation

### Style
To apply other style, edit layout file.
__/src/documents/laout/default.html.coffee__ around L97〜L102

    when 'impress.html.coffee'
      # write own style
      text @getBlock('styles').add([
        'http://fonts.googleapis.com/css?family=Open+Sans:regular,semibold,italic,italicsemibold|PT+Sans:400,700,400italic,700italic|PT+Serif:400,700,400italic,700italic'
        '/vendor/impress/css/impress-demo.css'
      ]).toHTML()


### More infomation

[impress.js](https://github.com/bartaz/impress.js/)

<hr class="soften">

### [Back Home](/)
