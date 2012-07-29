---
layout: default
style: 'deck'
---

text @content

# Include scripts
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

script type:"text/javascript", -> 
  """
  setTimeout(function(){
    $(function() {
      $('body').addClass('deck-container')
      $.deck('.slide');
    });
  },100)
  """