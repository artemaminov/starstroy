$ ->
  $(".fancybox").fancybox
    width: 850
    afterShow: ->
      $(".fancybox-inner").zoom
