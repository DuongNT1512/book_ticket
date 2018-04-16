$(document).on('turbolinks:load', function(){
  var ajax_theaters_url = $('#theaters_path').val();
  var ajax_shows_url = $('#shows_path').val();
  var movie_id, theater_id;
  var theater_template =
    '<li class="list-row">' +
      '<div class="theater-item hover-item" data-theater-id="{{:theater_id}}"' +
        'data-movie-id="{{:movie_id}}">' +
        '<p>{{:name}}</p>' +
      '</div>' +
    '</li>';

  var show_template =
    '<li class="list-row">' +
      '<div>' +
        '<h4 class="show-date">{{:date}}</h4>' +
        '<div class="row show-time">' +
          '{{for shows}}' +
            '<div class="col-md-4 text-center" style="float: left">' +
              '<div class="show-item hover-item" data-show-id="{{:id}}">' +
                '{{:start_time}}' +
              '</div>' +
            '</div>' +
          '{{/for}}' +
        '</div>' +
      '</div>' +
    '</li>';

  $('#show-index').on('click', '.movie-item', function(e){
    e.preventDefault();
    $('#movie-panel div').removeClass('selected');
    $(this).addClass('selected');
    $('#theater-list').html('');
    $('#show-list').html('');
    movie_id = $(this).data('movie-id');

    $.ajax({
      url: ajax_theaters_url,
      type: 'get',
      data: {movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        if(data.status){
          render_theaters(data.response);
          return;
        }
        render_error(data.message);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#show-index').on('click', '.theater-item', function(e){
    e.preventDefault();
    $('#theater-panel div').removeClass('selected');
    $(this).addClass('selected');
    $('#show-list').html('');
    theater_id = $(this).data('theater-id');

    $.ajax({
      url: ajax_shows_url,
      type: 'get',
      data: {theater_id: theater_id, movie_id: movie_id},
      dataType: 'json',
      success: function(data){
        if(data.status){
          render_shows(data.response);
          return;
        }
        render_error(data.message);
      },
      error: function(){
        alert(I18n.t('unexpected_error'));
      }
    });
  });

  $('#show-index').on('click', '.show-item', function(e){
    e.preventDefault();
    var show_id = $(this).data('show-id');
    var path = $('#show-panel input[name="order_new"]').val();
    window.location.href = path + '/?show_id=' + show_id;
  });

  function render_theaters(theaters){
    for(var i = 0; i < theaters.length; i++){
      var theater = theaters[i];
      var data = [{name: theater.name, theater_id: theater.id, movie_id: movie_id}];
      var template = $.templates(theater_template);
      var htmlOutput = template.render(data);
      $('#theater-list').append(htmlOutput);
    }
  }

  function render_shows(date_shows){
    for(var i = 0; i < date_shows.length; i++){
      var date = date_shows[i][0];
      var shows = date_shows[i][1];
      var data = [{date: date, shows: shows}];
      var template = $.templates(show_template);
      var htmlOutput = template.render(data);
      $('#show-list').append(htmlOutput);
    }
  }

  function render_error(message){
    alert(message);
  }
});
