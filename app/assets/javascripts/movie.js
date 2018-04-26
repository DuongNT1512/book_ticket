$(document).on('click', '#playing-movies', function(e){
  e.preventDefault();
  $('.playing-movies').show();
  $('#playing-movies').addClass('active');
  $('.coming-movies').hide();
  $('#coming-movies').removeClass('active');
});

$(document).on('click', '#coming-movies', function(e){
  e.preventDefault();
  $('.playing-movies').hide();
  $('#playing-movies').removeClass('active');
  $('.coming-movies').show();
  $('#coming-movies').addClass('active');
});
