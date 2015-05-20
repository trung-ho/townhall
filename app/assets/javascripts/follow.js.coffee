$ ->
  $('.follow-organization').click ->
    _self = $(this)
    $.ajax( 
      url: _self.data('href'),
      dataType: 'json'
    )