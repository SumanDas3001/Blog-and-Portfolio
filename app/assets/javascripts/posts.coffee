# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#delete').on 'click', ->
    post_id = $(this).data('comment-id')
    alert 'post delete'
    alert  post_id
    $.ajax
      url: '/posts/'+post_id
      type: 'DELETE'
      success: (r) ->
    return
return
