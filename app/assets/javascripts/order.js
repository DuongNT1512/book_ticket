$(document).on('turbolinks:load', function(){
  var seats = [];
  var price = 0;
  $('.seat-map-wrapper').on('click', '.seat', function(){
    var that = $(this);
    if(that[0].className.includes('reserved')){
      return;
    }
    if(that[0].className.includes('selected')){
      that.removeClass('selected');
      var index = seats.indexOf(that.data('seat-code'));
      seats.splice(index, 1);
      update_seats();
      price = price - parseFloat(that.data('ticket-price'));
      update_price();
    }
    else{
      that.addClass('selected');
      seats.push(that.data('seat-code'));
      update_seats();
      price = price + parseFloat(that.data('ticket-price'));
      update_price();
    }
  });

  function update_seats(){
    $('#seat-codes').html('');
    for(var i = 0; i < seats.length; i++){
      $('#seat-codes').append(seats[i] + ' ');
    }
  }

  function update_price(){
    var str = I18n.t('price', {price: price});
    $('#price').html(str);
  }

  $('#order-confirm').on('click', function(e){
    e.preventDefault();
    var show_id = $('input#show_id').val();
    var url = $('input#order_create').val();
    var user_signin = $('input#user_signin').val();

    if (seats.length == 0){
      return;
    }

    if (user_signin == 'true') {
      $.ajax({
        url: url,
        type: 'post',
        data: {seats: seats, show_id: show_id},
        dataType: 'json',
        success: function(data){
          if(data.status == 'success'){
            var order_id = data.order;
            window.location.href = url + '/' + order_id;
          }
          else {
            alert(I18n.t('unexpected_error'));
          }
        },
        error: function(){
          alert(I18n.t('unexpected_error'));
        }
      });
    }
    else {
      $('#login-modal').modal('show');
      $('#signin-error').html(I18n.t('order_signin_warning'));
      $('.signin-error').show();
    }
  });
});
