$ -> 
  $('.toggle-vote-detail').each ->
    wrap = $(this)
    button = wrap.find('.toggle-detail').first()
    detail = wrap.find('.detail').first()
    
    if(button.hasClass('show'))
      detail.slideDown()

    button.click ->
      if(button.hasClass('show'))
        button.removeClass('show')
        detail.stop( false, true ).slideUp()
      else
        button.addClass('show')
        detail.stop( false, true ).slideDown()
