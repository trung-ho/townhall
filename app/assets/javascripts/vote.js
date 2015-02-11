$(function(){ 
  $('a.yes').on("click", function() {
    $('#vote_vote_type').val('yes');
  });

  $('a.no').on("click", function() {
    $('#vote_vote_type').val('no');
  });

  //update the reason_ids when a checkbox has been clicked on
  $("#result_reason_wrap .css-checkbox").on('click', function() {
    clicked_reason_ids = $("#result_reason_wrap .css-checkbox:checked").map(function(){ return $(this).attr('id') }).get().join(',');
    //console.log(clicked_reason_ids);
    $('#vote_reason_ids').val(clicked_reason_ids);
  })

});


