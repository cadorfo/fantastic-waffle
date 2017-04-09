class MessageController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  respond_to :json
  def create
    if Message.create(permited_params)
      render json: { status: true}
    else
      render json: { status: false}
    end
  end

  private

  def permited_params

    params.require(:message).permit(:content, :message_type)
  end
end
