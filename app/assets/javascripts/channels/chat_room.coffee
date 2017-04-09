App.room = App.cable.subscriptions.create { channel: "ChatChannel", room: "ChatRoom" },
  received: (data) ->
    console.log(data)
    appendConversation(data)
  send_message: (data)->
    @perform 'send_message', data

appendConversation = (data) ->
  $("#conversation").append("<li class='mdl-list__item mdl-list__item--three-line'>
  <span class='mdl-list__item-primary-content'>
      #{chooseAvatarImage(data.user)}
      <span>#{data.user.name}</span>
  <span class='mdl-list__item-text-body'>
      #{data.message.translated_content}
  </span>
    </span>
  <span class='mdl-list__item-secondary-content'>
  <a class='mdl-list__item-secondary-action' href='#'><i class='material-icons'>star</i></a>
  </span>
  </li>")

chooseAvatarImage = (user) ->
  if(user.image == null)
    "<i class='material-icons mdl-list__item-avatar'>person</i>"
  else
    "<div class='section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone'>
      <div class='section__circle-container__circle mdl-color--accent section__circle--big'>
        <img class='section__circle-container__circle mdl-color--accent section__circle--big mdl-list__item-avatar' src='#{user.image}' />
      </div>
    </div>"




