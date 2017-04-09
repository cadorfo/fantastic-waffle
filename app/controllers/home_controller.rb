class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = ActionCable.server.connections.map(&:current_user).uniq {|item| item.id}
  end
end
