App.room = App.cable.subscriptions.create { channel: "ChatChannel", room: "ChatRoom" },
  received: (data) ->
    if data.update_type == "message"
      appendConversation(data)
    else
      removeOrAddUser(data)
  send_message: (data)->
    @perform 'send_message', data

appendConversation = (data) ->
  $("#conversation").append(data.content)
  $("#conversation").scrollTop($(document).height());



removeOrAddUser = (data) ->
  if data.update_type == "user_out"
    $("#user_list > .mdl-list__item[value='#{data.user.id}']").remove()
  else
    if $("#user_list > .mdl-list__item[value='#{data.user.id}']").size() == 0
      $("#user_list").append(data.new_user_content)


