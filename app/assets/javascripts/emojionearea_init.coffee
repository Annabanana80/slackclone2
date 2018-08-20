$(document).on 'turbolinks:load', ->
  $("#message_body").emojioneArea
    autoHideFilters: true
    events: keypress: (editor, event) ->
      if event.which is 13 && !event.shiftKey
        $("#message_body").val $('#message_body').data('emojioneArea').getText()
        $('#new_message').submit()
        $('#message_body').data('emojioneArea').setText ""
        event.preventDefault()
      return
