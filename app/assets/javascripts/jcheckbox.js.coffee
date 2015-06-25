$ -> 
  ordered_items = []
  
  clear_all = ->
    $('.checkboxHandler').removeClass 'active'
    $('.checkboxHandler span').text ''
    $('input:checkbox').removeAttr 'checked'
    ordered_items = []
    return

  $('input.css-checkbox').on 'click', (e) ->
    item_id = e.target.id
    if $.inArray(item_id, ordered_items) > -1
      ordered_items.splice $.inArray(item_id, ordered_items), 1
      $('input:checkbox').removeAttr 'checked'
    else
      if ordered_items.length < 3
        ordered_items.push item_id
        console.log ordered_items.length
    $('#vote_reason_ids').val ordered_items.join(',')
    return
  $('.btn-clear').click ->
    clear_all()
    false
  
  $('.jcheckbox').each ->
    _self = $(this)
    _self.wrap('<div class="checkboxHandler"></div>')
    checkbox = _self.parents('.checkboxHandler').first()
    checkbox.append('<span></span>')
    checkbox.click ->
      _self.click()

      if _self.is(':checked') && ordered_items.length <= 3
        $(this).addClass('active')
      else
        $(this).removeClass('active')

      ids = $('#vote_reason_ids').val().split(',')
      
      $('.checkboxHandler span').text('')

      $.each ids, (i, id) ->
        $('.jcheckbox[id="'+id+'"]').first().next().html(i+1)

    

