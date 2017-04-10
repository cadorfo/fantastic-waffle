class HomeController < ApplicationController
  before_action :authenticate_user!
  def index

    @users = ActionCable.server.connections.map(&:current_user).uniq {|item| item.id}
    @dialects = DialectEnum.to_a
    @messages = Message.recent_messages.sort{|item| item.updated_at}
  end
end
