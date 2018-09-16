$(document).ready ->
  $('.destroy').on 'click', ->
    post_id = $(this).data('post-id')
    alert post_id
    comment_id = $(this).data('comment-id')
    alert comment_id
    $.ajax
      # check: 'ajax working'
      url: '/posts/'+post_id+'/comments/'+comment_id
      type: 'DELETE'
      success: (r) ->
    return

  $('#add_comment').on 'click', ->
    post_id = $(this).data('value-id')
    # alert post_id
    name_id = $('#comment_name').val()
    # alert name_id
    body_id = $('#comment_body').val()
    # alert body_id
    # alert 'last check'
    request = $.ajax(
      # check: 'ajax working'
      type: 'POST'
      url: '/comments/'
      dataType: "json"
      data:
        post_id: post_id
        name: name_id
        body: body_id
      )
    request.done (data, textStatus, jqXHR) ->
      alert "ajax load"
      console.log data
      # $('.comment').prepend(data.body)
      contentStr = "<div class='comment_content'>"
      contentStr += "<p class='commment_name'><strong>#{data.name}</strong></p>"
      contentStr += "<p class='comment_body'>#{data.body}</p>"
      contentStr += "<p class='comment_time'>#{data.created_at}</p>"
      contentStr += "</div>"
      # contentStr = "if #{data.user_signed_in?}"
      contentStr += "<button id='destroy' data-comment-id = '#{data.id}' data-post-id = '#{post_id}'><strong> Delete<strong></button>"
      # contentStr += "<end>"
      $('.comment').prepend(contentStr)
    return
return

# contentstr
