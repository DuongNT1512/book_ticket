$(document).on('turbolinks:load', function(){
  var ajax_theaters_url = $('#quick-purchase-form input[name="ajax_theaters"]').val();
  var ajax_shows_url = $('#quick-purchase-form input[name="ajax_shows"]').val();
  var theater_default_option = $('#quick-purchase-form .theater').html();
  var date_default_option = $('#quick-purchase-form .date').html();
  var show_default_option = $('#quick-purchase-form .show').html();
  var movie_id, theater_id, dates_shows, date_index;

  $('#quick-purchase-form').on('change', '.movie', function(e){
    e.preventDefault();
    $('#quick-purchase-form .theater').html(theater_default_option);
    $('#quick-purchase-form .date').html(date_default_option);
    $('#quick-purchase-form .show').html(show_default_option);
    movie_id = $(this).val();

    $.ajax({
      url: ajax_theaters_url,
      type: 'post',
      data: {movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        render_quick_purchase_theaters(data);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#quick-purchase-form').on('change', '.theater', function(e){
    e.preventDefault();
    $('#quick-purchase-form .date').html(date_default_option);
    $('#quick-purchase-form .show').html(show_default_option);
    theater_id = $(this).val();

    $.ajax({
      url: ajax_shows_url,
      type: 'post',
      data: {theater_id: theater_id, movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        dates_shows = data;
        render_quick_purchase_dates(dates_shows);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#quick-purchase-form').on('change', '.date', function(e){
    e.preventDefault();
    $('#quick-purchase-form .show').html(show_default_option);
    date_index = $(this).val();

    var shows = dates_shows[date_index][1];
    render_quick_purchase_shows(shows);
  });

  $('#quick-purchase-form').on('change', '.show', function(e){
    e.preventDefault();
  });

  $('#quick-purchase-form').on('submit', function(e){
    e.preventDefault();
  });

  function render_quick_purchase_theaters(theaters){
    for(var i = 0; i < theaters.length; i++){
      var theater = theaters[i];
      var data = [{name: theater.name, id: theater.id}];
      var template = $.templates('#theater-item-template');
      var htmlOutput = template.render(data);
      $('.theater').append(htmlOutput);
    }
  }

  function render_quick_purchase_dates(dates_shows){
    for(var i = 0; i < dates_shows.length; i++){
      var date = dates_shows[i][0];
      var data = [{index: i, date: date}];
      var template = $.templates('#date-item-template');
      var htmlOutput = template.render(data);
      $('.date').append(htmlOutput);
    }
  }

  function render_quick_purchase_shows(shows){
    for(var i = 0; i < shows.length; i++){
      var show = shows[i];
      var data = [{id: show.id, start: show.start_time, end: show.end_time}];
      var template = $.templates('#show-item-template');
      var htmlOutput = template.render(data);
      $('.show').append(htmlOutput);
    }
  }
});
