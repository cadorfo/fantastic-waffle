class MessageController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  respond_to :json
  def create
    message = Message.create(permited_params.merge({user: current_user}))
    if message.persisted?
      message.translate_content!

      render json: { status: true}
    else
      render json: { status: false, errors: message.errors}
    end
  end

  private

  def permited_params

    params.require(:message).permit(:content, :message_type)
  end
end
