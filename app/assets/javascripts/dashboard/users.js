function redirectFacebookButton(){
  window.location.href = "/users/auth/facebook";
}

$(document).ready(function () {
  $("#password").hide();
  $(".password-change").click(function(){
    $("#password").toggle();
  });
});