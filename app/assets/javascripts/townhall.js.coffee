@DESKTOP_MIN_WIDTH = 1050;

$(document).ready ->
  desktopNav = $('#townhall-nav')
  mobileNav = desktopNav.clone()
  mobileNav.attr('id', 'townhall-nav-mobile')
  mobileNav.insertAfter(desktopNav)

  bindTogglePopup = ->
    $('[data-toggle="popup"]').on 'click', (e) ->
      $('.popup').hide()
      target = $(e.target).attr('href')
      $(target).show()
      return false

    $(document).on 'click', ->
      $('.popup').hide()

  bindMenuSlider = ->
    mobileNav.find('.logo-div').on 'click', ->
      mobileNav.offcanvas('hide')
      

    desktopNav.find('.logo-div').attr('data-toggle', 'dropdown')
    desktopNav.find('.logo-div').attr('data-related-target', '#townhall-nav')
    desktopNav.removeClass('navmenu-fixed-right').removeClass('offcanvas').addClass('dropdown')
    desktopNav.find('ul').addClass('dropdown-menu')
    desktopNav.find('[data-toggle=offcanvas]').attr('data-toggle', '')

    desktopNav.find('.logo-div').dropdown()
    $(document).on 'click', '#nav-toggle-btn .nav-toggle-icon', (e) ->
      desktopNav.find('.logo-div').dropdown('toggle')

  bindTogglePopup()
  bindMenuSlider()

  switchMenuSlider = ->
    if window.innerWidth < DESKTOP_MIN_WIDTH
      desktopNav.hide()
    else
      desktopNav.show()
  switchMenuSlider()
  $(window).resize ->
    switchMenuSlider()