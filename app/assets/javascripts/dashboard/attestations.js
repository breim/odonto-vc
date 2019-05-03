function printDiv(divName) {
  var printContents = document.getElementById(divName).innerHTML;
  var originalContents = document.body.innerHTML;
  document.body.innerHTML = printContents;
  window.print();
  document.body.innerHTML = originalContents;
}

$(function () {

  $('#company').text($('#attestation_company').val());
  $('[id="name"]').text($('#attestation_name').val());
  $('#address').text($('#attestation_address').val());
  $('#cro').text($('#attestation_cro').val());

  $('#unfit').hide();
  $('.unfit').hide();
  $('#attestation_unfit_days').hide();

  $('#attestation_name').change(function() {
    $('[id="name"]').text($(this).val());
  });
  $('#attestation_company').change(function() {
    $('#company').text($(this).val());
  });
  $('#attestation_address').change(function() {
    $('#address').text($(this).val());
  });
  $('#attestation_cro').change(function() {
    $('#cro').text($(this).val());
  });
  $('#attestation_work_or_study').change(function() {
    $('#work_or_study').text($(this).val());
  });
  $('#attestation_customer_name').change(function() {
    $('#customer_name').text($(this).val());
  });
  $('#attestation_date').change(function() {
    $('#date').text($(this).val());
  });
  $('#attestation_hour').change(function() {
    $('#hour').text($(this).val());
  });
  $('#attestation_fit_unfit').change(function() {
    $('#fit_unfit').text($(this).val());
    if ($(this).val() == "inapto"){
      $('#attestation_unfit_days').show();
      $('#unfit').show();
      $('.unfit').show();
    }else{
      $('#attestation_unfit_days').hide();
      $('#unfit').hide();
      $('.unfit').hide();
    }
  });

  $('#attestation_unfit_days').change(function() {
    $('#unfit_days').text($(this).val());
  });

  $('#attestation_observation').change(function() {
    $('#observation').text($(this).val());
  });

  $('#attestation_date').datetimepicker({
    timepicker:false,
    format:'d/m/Y'
  });

  $('#attestation_hour').datetimepicker({
    datepicker:false,
    step: 5,
    format:'H:i'
  });
});