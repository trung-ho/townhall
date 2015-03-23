$(function(){
  //Reasons part

  //update the reason_ids when a checkbox has been clicked on
  $("#result_reason_wrap .css-checkbox").on('click', function() {
    clicked_reason_ids = $("#result_reason_wrap .css-checkbox:checked").map(function(){ return $(this).attr('id') }).get().join(',');
    //console.log(clicked_reason_ids);
    $('#vote_reason_ids').val(clicked_reason_ids);
  })


});


