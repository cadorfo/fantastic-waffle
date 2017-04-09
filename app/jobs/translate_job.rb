class TranslateJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    translated_content = BabelTranslator.translate(content: message.content, type: message.message_type)
    message.translated_content = translated_content
    message.save!
    ChatChannel.broadcast_to("chat_ChatRoom", {
      message: message,
      user: message.user,
      type: message.message_type
    })
  end
end
