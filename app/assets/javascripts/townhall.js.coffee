$(document).ready ->
  $('[data-toggle="popup"]').on 'click', (e) ->
    $('.popup').hide()
    target = $(e.target).attr('href')
    $(target).show()
    return false


  $(document).on 'click', ->
    $('.popup').hide()