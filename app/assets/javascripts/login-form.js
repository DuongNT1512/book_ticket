$(document).on('click', 'a#login-btn', function(e){
  e.preventDefault();
  $('#login-modal').modal('show');
});

$(document).on('click', 'a#modal-signup', function(e){
  e.preventDefault();
  $('#signup-tab').show();
  $('#modal-signup').addClass('active');
  $('#signin-tab').hide();
  $('#modal-signin').removeClass('active');
});

$(document).on('click', 'a#modal-signin', function(e){
  e.preventDefault();
  $('#signup-tab').hide();
  $('#modal-signup').removeClass('active');
  $('#signin-tab').show();
  $('#modal-signin').addClass('active');
});
