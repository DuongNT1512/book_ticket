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
  });
});
