---
layout: default
style: 'h5slides'
---
text @content

# additional scripts
script type:"text/javascript", -> 
  """
    setTimeout(function(){
      $(function() {
        $('body').attr('display','none');
      });
    },500)
  """