$(document).on 'turbolinks:load', ->
  $('.article-title').each (index, element) ->
    $clamp element, {clamp: 3}
  $('.article-preview').each (index, element) ->
    $clamp element, {clamp: '180px'}
