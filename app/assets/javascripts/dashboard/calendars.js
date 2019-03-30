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
    url: "/dashboard/customers?search=" + search_field,
  }).done(function() {
    $( this ).addClass( "done" );
  });
}

$( document ).ready(function() {
    var start_date = '';
    var end_date = '';

    $('#calendar').fullCalendar({
      minTime: '06:00:00',
      slotDuration: '00:30:00',

      header: {
        left: 'title',
        center: 'today, agendaDay, agendaWeek, month, listWeek',
        right: 'prev, next'
      },
      aspectRatio: 1.2,
      dayClick: function(date, jsEvent, view, resourceObj) {
        localStorage.setItem("date_selected", date.format());
        $('#newConsultation').modal('toggle');
      },
      // View render to get current dates periods of view aviable (prevent massive load of events and db)
      viewRender: function(view, element) {
        start_date = moment(view.start).format('DD-MM-YYYY');
        end_date = moment(view.end).format('DD-MM-YYYY');
      },
      eventClick: function(calEvent, jsEvent, view) {
        $.ajax({
          async: true,
          url: '/dashboard/consultas/'+ calEvent.id +'/edit',
          type: 'GET',
          dataType: 'script',
          success: function(response){
            if(response.status == 'success')
              alert('processou');
            },
            error: function(e){
              alert('erro ao processar');
              alert('Error processing your request: '+e.responseText);
            }
        });
      },
      defaultDate: new Date(),
      locale: "pt-br",
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: false, // allow "more" link when too many events
      
      events: function(start, end, timezone, callback) {
        $.ajax({
          async: true,
          url: '/dashboard/consultas.json',
          dataType: 'json',
          data: {
            // our hypothetical feed requires UNIX timestamps
            start: start_date,
            end: end_date
          },
          success: function(doc) {
            var events = [];
            $.each(doc.consultations, function (i, customer) {
              events.push({
                id: $(this).attr('id'),
                title: $(this).attr('title'),
                start: $(this).attr('start'),
                end: $(this).attr('end'),
                color: '#1b98e0',
                editable: false
              });
            })
          callback(events);
          }
        });
      }
    });
  }); 