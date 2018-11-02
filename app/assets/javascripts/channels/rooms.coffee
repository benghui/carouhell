$(document).on 'turbolinks:load', ->
  messages = $('#messages') if $('#messages').length > 0
  messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
  messages_to_bottom()

  App.global_chat = App.cable.subscriptions.create {
    channel: "ChatroomsChannel"
    chatroom_id: messages.data('chatroom-id')
    },
    
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Data received
      console.log("DATA:", data)
      # data['message']
      # data['user']
      # messages.append data['message']
      messages_to_bottom()

    # send_message: (message, chatroom_id) ->
    #   @perform 'send_message', message: message, chatroom_id: chatroom_id

send_message = (message, chatroom_id) ->
  $('#message_body').on 'keydown', (event) ->
    if event.keyCode is 13
      console.log(event)
    # $('#new_message').submit (e) -> this = $(this)
    # textarea = $(this).find('#message_body')
    # if $.trim(textarea.val()).length > 1
    #   App.global_chat.send_message textarea.val(), messages.data('chatroom-id')
    #   textarea.val('')
    #   e.preventDefault()
    #   returnfalse