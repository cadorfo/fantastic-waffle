class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:chat_#{params[:room]}"
  end

  def send_message(data)

    message =Message.create(data["message"].merge({user: current_user}))
    message.tranlate_content
  end
end