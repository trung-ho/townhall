$(document).ready ->
  bindTogglePopup()
  bindMenuSlider()

bindTogglePopup = ->
  $('[data-toggle="popup"]').on 'click', (e) ->
    $('.popup').hide()
    target = $(e.target).attr('href')
    $(target).show()
    return false

  $(document).on 'click', ->
    $('.popup').hide()

bindMenuSlider = ->
  $('#townhall-nav .logo-div').on 'click', ->
    $('#townhall-nav').offcanvas('hide')