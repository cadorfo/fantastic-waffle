class TranslateJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    translated_content = BabelTranslator.translate(content: message.content, type: message.message_type)
    message.translated_content = translated_content
    message.save!
    ChatChannel.broadcast_to("chat_ChatRoom", {
      update_type: "message",
      message: message,
      content: render_new_user(message),
      user: message.user,
      type: message.message_type
    })
  end

  private

  def render_new_user(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
