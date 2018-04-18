$(document).on('turbolinks:load', function(){
  var ajax_theaters_url = $('#show-index input[name="ajax_theaters"]').val();
  var ajax_shows_url = $('#show-index input[name="ajax_shows"]').val();
  var movie_id, theater_id;

  $('#show-index').on('click', '.movie-item', function(e){
    e.preventDefault();
    $('#movie-panel div').removeClass('active');
    $(this).addClass('active');
    $('#theater-list').html('');
    $('#show-list').html('');
    movie_id = $(this).data('movie-id');

    $.ajax({
      url: ajax_theaters_url,
      type: 'post',
      data: {movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        render_theaters(data);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#show-index').on('click', '.theater-item', function(e){
    e.preventDefault();
    $('#theater-panel div').removeClass('active');
    $(this).addClass('active');
    $('#show-list').html('');
    theater_id = $(this).data('theater-id');

    $.ajax({
      url: ajax_shows_url,
      type: 'post',
      data: {theater_id: theater_id, movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        render_shows(data);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#show-index').on('click', '.show-item', function(e){
    e.preventDefault();
  });

  function render_theaters(theaters){
    for(var i = 0; i < theaters.length; i++){
      var theater = theaters[i];
      var data = [{name: theater.name, theater_id: theater.id, movie_id: movie_id}];
      var template = $.templates('#theater-item-template');
      var htmlOutput = template.render(data);
      $('#theater-list').append(htmlOutput);
    }
  }

  function render_shows(date_shows){
    for(var i = 0; i < date_shows.length; i++){
      var date = date_shows[i][0];
      var shows = date_shows[i][1];
      var data = [{date: date, shows: shows}];
      var template = $.templates('#show-item-template');
      var htmlOutput = template.render(data);
      $('#show-list').append(htmlOutput);
    }
  }
});
