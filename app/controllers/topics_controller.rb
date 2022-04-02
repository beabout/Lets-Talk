class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show ]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(title: params[:topic][:title], domain: params[:topic][:domain].to_i)
    if @topic.save
      flash[:notice] = "Topic created"
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def show
    @conversations = @topic.conversations.order(likes: :desc)
  end

  private 

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :domain, :slug)
  end
end
