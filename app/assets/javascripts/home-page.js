$(document).on('turbolinks:load', function(){
  $('.article-title').each(function(index, element){
    $clamp(element, {clamp: 3});
  });

  $('.article-preview').each(function(index, element){
    $clamp(element, {clamp: '180px'});
  });
});
