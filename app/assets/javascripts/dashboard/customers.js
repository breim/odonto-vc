// Registration
VMasker(document.querySelector("#customer_phone")).maskPattern("(99) 9999-9999");
VMasker(document.querySelector("#customer_celphone")).maskPattern("(99) 99999-9999");
VMasker(document.querySelector("#customer_cpf")).maskPattern("999.999.999-99");

function cpfVal(cpf){
  if (validateCPF(cpf)){
    $('#cpfValidate').html('<span class="text-success">CPF válido</span>');
  }else{
    $('#cpfValidate').html('<span class="text-danger">CPF inválido</span>');
  }
}

// ValidateCPF
function validateCPF(strCPF) {
  var Soma;
  var Resto;
  Soma = 0;
  strCPF = strCPF.replace(/\D/g,'');
  if (strCPF == "00000000000") return false;

  for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;
  
  if ((Resto == 10) || (Resto == 11))  Resto = 0;
  if (Resto != parseInt(strCPF.substring(9, 10)) ) return false;
  
  Soma = 0;
  for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;
  
  if ((Resto == 10) || (Resto == 11))  Resto = 0;
  if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false;
  return true;
}

$("#customer_zipcode").blur(function() {
  //Nova variável "cep" somente com dígitos.
  var cep = $(this).val().replace(/\D/g, '');

  //Verifica se campo cep possui valor informado.
  if (cep != "") {

    //Expressão regular para validar o CEP.
    var validacep = /^[0-9]{8}$/;

    //Valida o formato do CEP.
    if(validacep.test(cep)) {

      //Preenche os campos com "..." enquanto consulta webservice.
      $("#customer_address").val("...");
      $("#customer_distric").val("...");
      $("#customer_city").val("...");
      $("#customer_state").val("...");

      //Consulta o webservice viacep.com.br/
      $.getJSON("//viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
        if (!("erro" in dados)) {
          //Atualiza os campos com os valores da consulta.
          $("#customer_address").val(dados.logradouro);
          $("#customer_distric").val(dados.bairro);
          $("#customer_city").val(dados.localidade);
          $("#customer_state").val(dados.uf);
          $('#customer_number').focus();
        } else {
          //CEP pesquisado não foi encontrado.
          limpa_formulário_cep();
          alert("CEP não encontrado.");
        }
      });
    } else {
      //cep é inválido.
      limpa_formulário_cep();
      alert("Formato de CEP inválido.");
    }
  } else {
    //cep sem valor, limpa formulário.
    limpa_formulário_cep();
  }
});



$('#my_camera').hide();
$('#take_photo').hide();
function new_photo(){
  Webcam.set({
    width: 240,
    height: 180,
    image_format: 'jpeg',
    jpeg_quality: 100
  });
  Webcam.attach( '#my_camera' );
  $('#cust_img').hide();
  $('#my_camera').show();
  $('#take_photo').show();
}

function take_snapshot() {
  Webcam.snap( function(data_uri) {
    $("#cust_img").attr("src", data_uri);
    $('#my_camera').hide();
    $('#cust_img').show();
    $('#customer_image_base64').val(data_uri);
  } );
}

$('#customersRegistration').on("hidden.bs.modal", function () {
  Webcam.reset();
});
