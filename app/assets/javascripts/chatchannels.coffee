handleUserViews = ->
    $unread = $(".unread")
    if $unread.length > 0
      chatchannel_id = $("[data-behavior='messages']").data("chatchannel-id")
      App.last_read.update(chatchannel_id)
      $unread.remove()

$(document).on "turbolinks:load", ->
  $('.sidenav').sideNav();
  $('.button-collapse').sideNav('show');
  
  $('.button-collapse').sideNav('hide');
  $(document).on "click", handleUserViews

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    chatchannel_id = $("[data-behavior='messages']").data("chatchannel-id")
    body        = $("#message_body")

    App.chatchannels.send_message(chatchannel_id, body.val())

    body.val("")
  $("#uploadBtn").on "click", (e) ->
    e.preventDefault()
    
    console.log("i'm clicked")

  $(".dropdown-trigger").dropdown();  
  $('.modal').modal();
