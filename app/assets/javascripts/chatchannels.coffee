handleUserViews = ->
    $unread = $(".unread")
    if $unread.length > 0
      chatchannel_id = $("[data-behavior='messages']").data("chatchannel-id")
      App.last_read.update(chatchannel_id)
      $unread.remove()

$(document).on "turbolinks:load", ->
  $(document).on "click", handleUserViews

  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    chatchannel_id = $("[data-behavior='messages']").data("chatchannel-id")
    body        = $("#message_body")

    App.chatchannels.send_message(chatchannel_id, body.val())

    body.val("")


  $(".dropdown-trigger").dropdown();  
  $('.modal').modal();

  