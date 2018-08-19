App.chatchannels = App.cable.subscriptions.create "ChatchannelsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatchannel = $("[data-behavior='messages'][data-chatchannel-id='#{data.chatchannel_id}']")
    if active_chatchannel.length > 0

      if document.hidden
        if $(".unread").length == 0
          active_chatchannel.append("<div class='unread'><span>Unread Messages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        App.last_read.update(data.chatchannel_id)

      # Insert the message
      active_chatchannel.append("<div class='breaking'><div class='chip'>#{data.username}:</div>#{data.body}</div>")

    else
      $("[data-behavior='chatchannel-link'][data-chatchannel-id='#{data.chatchannel_id}']").css("font-weight", "bold")

  send_message: (chatchannel_id, message) ->
    @perform "send_message", {chatchannel_id: chatchannel_id, body: message}

    