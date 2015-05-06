@DESKTOP_MIN_WIDTH = 1050;

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
  if window.innerWidth < DESKTOP_MIN_WIDTH
    $('#townhall-nav .logo-div').on 'click', ->
      $('#townhall-nav').offcanvas('hide')
  else
    $('#townhall-nav .logo-div').attr('data-toggle', 'dropdown')
    $('#townhall-nav .logo-div').attr('data-related-target', '#townhall-nav')
    $('#townhall-nav').removeClass('navmenu-fixed-right').removeClass('offcanvas').addClass('dropdown')
    $('#townhall-nav ul').addClass('dropdown-menu')
    $('[data-toggle=offcanvas]').attr('data-toggle', '')

    $('#townhall-nav .logo-div').dropdown()
    $(document).on 'click', '#nav-toggle-btn .nav-toggle-icon', (e) ->
      $('#townhall-nav .logo-div').dropdown('toggle')