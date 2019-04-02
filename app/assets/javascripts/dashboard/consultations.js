$('#consultation_date').datetimepicker({
  lang:'pt',
  timepicker:false,
  format:'d/m/Y'
});

$('#consultation_hour').datetimepicker({
  datepicker:false,
  step: 5,
  format:'H:i'
});
