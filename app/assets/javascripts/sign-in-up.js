$(document).on('turbolinks:load', function(){
  $('#signup-tab').on('submit', function(e){
    e.preventDefault();
    $('.signup-errors').hide();

    var url = $('#signup-tab form').attr('action');
    var method = $('#signup-tab form').attr('method');

    $.ajax({
      type: method,
      url: url,
      data: {user: {
        email: $('form#new_user #sign_up_email').val(),
        password: $('form#new_user #sign_up_password').val(),
        password_confirmation: $('form#new_user #user_password_confirmation').val(),
        first_name: $('form#new_user #user_first_name').val(),
        last_name: $('form#new_user #user_last_name').val(),
        birthday: $('form#new_user #user_birthday').val(),
        gender: $('form#new_user #user_gender').val(),
        address: $('form#new_user #user_address').val()
      }},
      dataType: 'json',
      success: function(){
        signup_success();
      },
      error: function(data){
        signup_error(data);
      }
    });
  });
});

function signup_success(){
  $('#signup-btn').removeAttr('disabled');
  $('#login-modal').modal('hide');
  location.reload();
}

function signup_error(data){
  var errors = data.responseJSON.errors;
  $('#signup-btn').removeAttr('disabled');
  if(errors['email']){
    $('#email-errors').html(errors['email'][0]);
    $('#email-errors').show();
  }
  if(errors['password']){
    $('#password-errors').html(errors['password'][0]);
    $('#password-errors').show();
  }
  if(errors['password_confirmation']){
    $('#password_confirmation-errors').html(errors['password_confirmation'][0]);
    $('#password_confirmation-errors').show();
  }
  if(errors['first_name']){
    $('#first_name-errors').html(errors['first_name'][0]);
    $('#first_name-errors').show();
  }
  if(errors['last_name']){
    $('#last_name-errors').html(errors['last_name'][0]);
    $('#last_name-errors').show();
  }
  if(errors['birthday']){
    $('#birthday-errors').html(errors['birthday'][0]);
    $('#birthday-errors').show();
  }
  if(errors['gender']){
    $('#gender-errors').html(errors['gender'][0]);
    $('#gender-errors').show();
  }
  if(errors['address']){
    $('#address-errors').html(errors['address'][0]);
    $('#address-errors').show();
  }
}

$(document).on('turbolinks:load', function(){
  $('#signin-tab').on('submit', function(e){
    e.preventDefault();
    $('.signin-error').hide();

    var url = $('#signin-tab form').attr('action');
    var method = $('#signin-tab form').attr('method');

    $.ajax({
      type: method,
      url: url,
      data: {user: {
        email: $('#signin-tab form #sign_in_email').val(),
        password: $('#signin-tab form #sign_in_password').val(),
        remember_me: $('#signin-tab form input[name="user[remember_me]"]').val()
      }},
      dataType: 'json',
      success: function(){
        $('#signup-btn').removeAttr('disabled');
        $('#login-modal').modal('hide');
        location.reload();
      },
      error: function(data){
        $('#signin-error').html(data.responseJSON.message);
        $('#signin-error').show();
        $('#signin-btn').removeAttr('disabled');
      }
    });
  });
});
