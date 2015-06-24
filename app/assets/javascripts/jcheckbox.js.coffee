$ -> 
  $('.jcheckbox').each ->
    _self = $(this)
    _self.wrap('<div class="checkboxHandler"></div>')
    checkbox = _self.parents('.checkboxHandler').first()
    checkbox.append('<span></span>')
    checkbox.click ->
      _self.click()

      if _self.is(':checked')
        $(this).addClass('active')
      else
        $(this).removeClass('active')

      ids = $('#vote_reason_ids').val().split(',')
      
      $('.checkboxHandler span').text('')

      $.each ids, (i, id) ->
        $('.jcheckbox[id="'+id+'"]').first().next().html(i+1)

    

