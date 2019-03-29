$('#search').keyup(function(e) {
  clearTimeout($.data(this, 'timer'));
  if (e.keyCode == 13){
    search(true);
    $('#location tbody').children().detach();
  }else{
    $(this).data('timer', setTimeout(searchCustomersView, 900));
  }
});
function searchCustomersView() {
  var search_field = document.getElementById( "search" ).value;
  $.ajax({
    async: true,
    dataType: "script",
    url: "/dashboard/agenda/search?search=" + search_field,
  }).done(function() {
    $( this ).addClass( "done" );
  });
}