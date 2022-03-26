class PortalController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @participations = @user.participations
    @following_conversations = @user.following_conversations
  end
end
