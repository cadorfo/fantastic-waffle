class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:chat_#{params[:room]}"
  end
end