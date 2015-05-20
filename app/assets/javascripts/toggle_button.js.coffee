$ ->
  $('.toggle-button').on 'ajax:success', (e, data, status, xhr) ->
    if data.status
      $(this).addClass('button-yes').removeClass('button-no')
    else
      $(this).removeClass('button-yes').addClass('button-no')
    if data.notice
      return alert(data.notice)
    return