class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    puts params[:topic]
    @topic = Topic.new(title: params[:topic][:title], domain: params[:topic][:domain].to_i)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      flash[:notice] = "Topic created"
      render :new
    end
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @conversations = @topic.conversations.order(likes: :desc)
  end

  private 

  def topic_params
    params.require(:topic).permit(:title, :domain, :slug)
  end
end
