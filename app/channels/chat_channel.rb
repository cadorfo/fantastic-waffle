class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:chat_#{params[:room]}"
    ChatChannel.broadcast_to("chat_ChatRoom", {
      update_type: "user_in",
      user: current_user,
      new_user_content: render_new_user
    })
  end

  def unsubscribed
    ChatChannel.broadcast_to("chat_ChatRoom", {
      update_type: "user_out",
      user: current_user,
    })
  end

  def send_message(data)
    message =Message.create(data["message"].merge({user: current_user}))
    message.tranlate_content!
  end

  private
  def render_new_user
    ApplicationController.renderer.render(partial: 'users/user', locals: {user: current_user})
  end

end