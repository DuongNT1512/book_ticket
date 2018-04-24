$(document).on('turbolinks:load', function(){
  var amount = $('#order-amount').val();
  paypal.Button.render({
    env: 'sandbox',
    client: {
      sandbox: 'AYeIOvFzMWYP6LK0sir-l6t-gz0a21m5nZhzk8l8XoBF7MU43oBExK94ki5y0pH2AxgTewG1UK-XlXLX',
      production: 'AaiMha4WSVWA0e_Yu_wj2s53zphSQBPqe7EiiwhxO-LVpL1UqEcHNf1NhVdB2SCJJzYxlHcPnCWevN3O'
    },
    commit: true,
    style: {
      color: 'gold',
      size: 'medium',
      shape: 'rect',
      label: 'pay'
    },
    payment: function(data, actions) {
      return actions.payment.create({
        payment: {
          transactions: [{amount: {total: amount.toString(), currency: 'USD'}}]
        }
      });
    },
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        $.ajax({
          url: $('input#order-pay').val(),
          type: 'post',
          dataType: 'json',
          success: function(data){
            if(data.status != 'success'){
              alert(I18n.t('unexpected_error'));
              return;
            }
          },
          error: function(){
            alert(I18n.t('unexpected_error'));
          }
        });
        $('.paypal').hide();
        $('#cancel-order').hide();
        $('#order-status').html(I18n.t('orders.show.succeeded'));
        window.alert(I18n.t('payment_complete'));
      });
    },
    onCancel: function(data, actions) {
      return actions.payment.execute().then(function() {
        window.alert(I18n.t('payment_cancelled'));
      });
    },
    onError: function(data, actions) {
      return actions.payment.execute().then(function() {
        window.alert(I18n.t('payment_error'));
      });
    }
  }, '#paypal-button');
});
