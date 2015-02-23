$(function(){ 
  var vote_type = $('#vote_vote_type');
  $('a.yes').on("click", function() {
    console.log('clicked yes');
    vote_type.val('yes');
    hide_step_1();
    $('ul.pro').show();
  });

  $('a.no').on("click", function() {
    console.log('clicked no');
    vote_type.val('no');
    hide_step_1();
    $('ul.against').show();
  });

  //update the reason_ids when a checkbox has been clicked on
  $("#result_reason_wrap .css-checkbox").on('click', function() {
    clicked_reason_ids = $("#result_reason_wrap .css-checkbox:checked").map(function(){ return $(this).attr('id') }).get().join(',');
    //console.log(clicked_reason_ids);
    $('#vote_reason_ids').val(clicked_reason_ids);
  })


  function hide_step_1() {
    $('#result_reason_wrap').show();
    $('.main_container').hide();
    $('.date_votes').hide();
    $('.yes_no').hide();
    $('.check_text').hide();
  }

});


