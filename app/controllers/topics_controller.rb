class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    
  end

  def create
    
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end
end
