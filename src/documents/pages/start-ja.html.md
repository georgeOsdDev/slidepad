---
title: '使い方'
name: '使い方'
linkTitle: '使い方'
pageOrder: 1
layout: 'page'
tags: ['page']
---

# Getting Started
## 目次
* [概要](#10)
* [稼働環境](#20)
* [インストール](#30)
* [スライドコンテンツの作成](#40)
 * [Bigをテンプレートに使う場合](#41)
 * [deck.jsをテンプレートに使う場合](#42)
 * [html5slidesをテンプレートに使う場合](#43)
 * [impress.jsをテンプレートに使う場合](#44)

<hr id="10" class="soften">

## 概要
Slidepadは[Docpad](https://github.com/bevry/docpad)をベースとしたmarkdownファイルからHTMLプレゼンテーションを作成するツールです。
markdownファイルからプレゼンテーション用HTMLの出力、サーバ機能を提供します。
テンプレートには[Big](https://github.com/tmcw/big/)、[deck.js](http://imakewebthings.com/deck.js/)、[html5slides](http://code.google.com/p/html5slides/)、[impress.js](https://github.com/bartaz/impress.js/)のいずれかを選択することができます。

<hr id="20" class="soften">

## 稼働環境
SlidepadはNode.jsアプリケーションのため、事前にNode.jsをインストールしておく必要があります。
インストール方法についてはNode.jsの[オフィシャル](http://nodejs.org/)にてご確認ください。
なお、package.jsonの内容は以下のとおりです。

    "engines": {
      "node": "0.8.x",
      "npm": "1.1.x"
    },
    "dependencies": {
      "docpad": "6.x",
      "docpad-plugin-cleanurls": "2.x",
      "docpad-plugin-coffeescript": "2.x",
      "docpad-plugin-eco": "2.x",
      "docpad-plugin-markdown": "2.x",
      "docpad-plugin-stylus": "2.x",
      "docpad-plugin-text": "2.x",
      "docpad-plugin-coffeekup": "~2.1.1"
    },
    "devDependencies": {
      "docpad-plugin-livereload": "2.x"
    },

docpad-plugin-livereloadプラグインはwebsocketを使ってリアルタイムに変更を描画する機能ですので、
websocketが使えるブラウザ推奨です。

<hr id="30" class="soften">

## インストール
__Slidepadのインストール__

    git clone http://github.com/georgeOsdDev/slidepad.git
    cd slidepad
    npm install

__サーバ起動__

    npm install -g docpad
    docpad run

__docpadコマンドを使わないでサーバ起動する場合__

    node node_modules/docpad/bin/docpad-server

デフォルトでは9778ポートを使用します。
http://localhost:9778

<hr id="40" class="soften">
## スライドコンテンツの作成
SlidepadではMarkdownファイルの保存場所および、メタ情報を元に各スライドテンプレートに変換します。

<hr id="41" class="soften">

### Bigをテンプレートに使う場合

__マークダウン__

    ---
    title: 'big1'
    pageOrder: 1
    tags: ['big']
    ---
    use _&harr;_ to navigate

---で囲まれた先頭５行がメタ情報となります。
なお、---で囲まれた部分はcoffee-scriptの文法となります。

* titleには名前を指定します。（任意）
* pageOrderにはスライドに表示する順番を記載します。__（必須）__
* tagsには'big'を含めてください。__（必須）__

__保存先__

    /src/documents/big/

__変換内容__

Bigはdivエレメント単位でスライドを表示するためSlidepadでは１マークダウンファイルを1divエレメントとしてindex.htmlに出力します。

__スタイル__

デフォルトではBigのデフォルトCSSを適用しています。
別のスタイルを適用したい場合は、/src/documents/laout/default.html.coffeeのL71付近を修正してください。

    switch @document.layout
      when 'big.html.coffee'
        link rel:'stylesheet', href:'/vendor/big/big.css', type:'text/css'
        script src:'/vendor/big/big.js'

__表示__

  http://localhost:9778/big

__参考__

Bigについて詳しくは[こちら](https://github.com/tmcw/big/)

<hr id="42" class="soften">
### deck.jsをテンプレートに使う場合

__マークダウン__

    ---
    sectionId:'deck2'
    title: 'deck2'
    pageOrder: 2
    tags: ['deck']
    child: ['deck3','deck4','deck5']
    ---
    ## Deck.js is
    ### Modern HTML Presentations

---で囲まれた先頭５行がメタ情報となります。
なお、---で囲まれた部分はcoffee-scriptの文法となります。

* sectionIdにはスライドのsection別のidを記載します。__（必須）__
* titleには任意の名前を指定します。（任意）
* pageOrderにはスライドに表示する順番を記載します。__（必須）__
* tagsには'deck'を含めてください。__（必須）__
* childは1スライド内で複数のセクションをネストさせる場合に記載します。（任意）

__保存先__

    /src/documents/deck/

__変換内容__

deck.jsはsectionエレメント単位でスライドを表示・アニメーションするためSlidepadでは１マークダウンファイルを1sectionエレメントとしてindex.htmlに出力します。
１スライド内で複数のセクションをアニメーションさせるためにはchildを記載する必要があります。

__スタイル__

デフォルトではdeck.jsのswissスタイルを適用しています。
別のスタイルを適用したい場合は、/src/documents/laout/default.html.coffeeのL74〜L90付近を修正してください。

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

また、deck.jsの拡張機能については
/src/documents/laout/deck.html.coffeeのL12〜L17でインポートしています。

    text @getBlock('scripts').add([
      '/vendor/jquery.js'
      '/vendor/deck/core/deck.core.js'
      '/vendor/deck/extensions/hash/deck.hash.js'
      '/vendor/deck/extensions/menu/deck.menu.js'
      '/vendor/deck/extensions/goto/deck.goto.js'
      '/vendor/deck/extensions/status/deck.status.js'
      '/vendor/deck/extensions/navigation/deck.navigation.js'
      '/vendor/deck/extensions/scale/deck.scale.js'
    ]).toHTML()

カスタマイズは
/src/documents/deck/index.html.coffeeのL37移行を参照ください。
拡張機能の使い方については[オフィシャル](http://imakewebthings.com/deck.js/docs/)を参照してください。

__表示__

  http://localhost:9778/deck.js/

__参考__

deck.jsについて詳しくは[こちら](http://imakewebthings.com/deck.js/docs/)

<hr id="43" class="soften">
### html5slidesをテンプレートに使う場合

__マークダウン__

    ---
    title: 'h5slides2'
    pageOrder: 2
    tags: ['h5slides']
    additionalClass:'build'
    ---

    ### about html5slides
     * Official : http://code.google.com/p/html5slides/
     * Official Demo : http://html5slides.googlecode.com/svn/trunk/template/index.html


---で囲まれた先頭５行がメタ情報となります。
なお、---で囲まれた部分はcoffee-scriptの文法となります。

* titleには任意の名前を指定します。（任意）
* pageOrderにはスライドに表示する順番を記載します。__（必須）__
* tagsには'h5slides'を含めてください。__（必須）__
* 追加でclassを適用する場合はadditionalClassを記載してください。（任意）
 * スライド内アニメーションを適用する場合は'build'と記載します。

__保存先__

    /src/documents/h5slides/

__変換内容__

html5slidesはarticleエレメント単位でスライドを表示するためSlidepadでは１マークダウンファイルを1articleエレメントとしてindex.htmlに出力します。

__スタイル__

デフォルトではdefault Google templateを適用しています。
別のスタイルを適用したい場合は、/src/documents/h5slides/index.html.coffeeのL11を修正してください。
適用可能なスタイルについては[こちら](http://code.google.com/p/html5slides/)を参照してください。
    section class:'slides layout-regular template-default', ->


__表示__

  http://localhost:9778/h5slides

__参考__

html5slidesについて詳しくは[こちら](http://code.google.com/p/html5slides/)

<hr id="44" class="soften">
### impress.jsをテンプレートに使う場合

__マークダウン__

    ---
    sectionId:'source'
    title: 'impress7'
    pageOrder: 7
    tags: ['impress']
    datax: 6300
    datay: 2000
    datarotate: 20
    datascale: 4
    additonalClass : ""
    ---
    Save it at '/src/documents/impress'
    Start server 'docpad run'
    and then access [http://localhost:9778/impress.js](http://localhost:9778/impress.js)

    want to know more?
    Read [Get Started](/pages/start)
    Luke!

---で囲まれた先頭５行がメタ情報となります。
なお、---で囲まれた部分はcoffee-scriptの文法となります。

* sectionIdにはスライドのsection別のidを記載します。（任意）
 * 必須ではありませんが、デモではimpress.jsのサンプルCSSを適用しているため設定しています。
* titleには任意の名前を指定します。（任意）
* pageOrderにはスライドに表示する順番を記載します。__（必須）__
* tagsには'impress'を含めてください。__（必須）__
* impress.jsで使用するメタデータを任意で記載します。（任意）
 * 使用可能なメタデータ
   * datax data-xに変換されます
   * datay data-yに変換されます
   * dataz data-zに変換されます
   * datarotate data-rotateに変換されます
   * datarotatex data-rotate-xに変換されます
   * datarotatey data-rotate-yに変換されます
   * datarotatez data-rotate-zに変換されます
   * datascale data-scaleに変換されます

* additionalClassには追加したいクラスを任意で記載します。（任意）

__保存先__

    /src/documents/impress.js/

__変換内容__

impress.jsのステップ単位にメタ情報を追記して１マークダウンファイルを1articleステップとしてindex.htmlに出力します。

__スタイル__

デフォルトではimpress.jsオフィシャルデモのCSSを適用しています。
任意のスタイルは変更可能です。
別のスタイルを適用したい場合は、/src/documents/laout/default.html.coffeeのL97〜L102付近を修正してください。

    when 'impress.html.coffee'
      # write own style
      text @getBlock('styles').add([
        'http://fonts.googleapis.com/css?family=Open+Sans:regular,semibold,italic,italicsemibold|PT+Sans:400,700,400italic,700italic|PT+Serif:400,700,400italic,700italic'
        '/vendor/impress/css/impress-demo.css'
      ]).toHTML()


__表示__

  http://localhost:9778/impress.js

__参考__

impress.jsについて詳しくは[こちら](https://github.com/bartaz/impress.js/)


<hr class="soften">

### [Back Home](/)
