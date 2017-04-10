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
      content: TranslateJob.render_new_message(message),
      user: message.user,
      type: message.message_type
    })
  end


  def self.render_new_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end
