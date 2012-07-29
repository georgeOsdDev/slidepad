---
layout: default
style: 'impress'
---

div '.fallback-message', ->
  p "Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a simplified version of this presentation."
  p "For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser."

text @content

# Include scripts
text @getBlock('scripts').add([
  '/vendor/jquery.js'
  '/vendor/impress/js/impress.js'
]).toHTML()
script type:"text/javascript", -> 
  """
    setTimeout(function(){
      $(function() {
        impress().init();
      });
    },500)
  """

