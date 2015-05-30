$ -> 
  $('a.popup-opener').click ->
    popup_id = $(this).attr('href')
    $(popup_id).modal('show')
    return false