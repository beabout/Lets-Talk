class ConversationsController < ApplicationController
  def index
    @conversations = begin
      if params[:q]
        query = params[:q]
        Conversation.joins(:topic).where(
          "topics.title LIKE ? OR position_a LIKE ? OR position_b LIKE ?",
          "%#{query[0]}%",
          "%#{query[0]}%", 
          "%#{query[0]}%").order(likes: :desc)
      else
        Conversation.order(likes: :desc)
      end
    end
  end[0]

  def show
    @conversation = Conversation.friendly.find(params[:id])
    respond_to do |format|
      format.html { }
      format.json { render json: @conversation }
    end
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(
      topic_id: params[:conversation][:topic], 
      creator_id: params[:conversation][:creator_id],
      position_a: params[:conversation][:position_a],
      position_b: params[:conversation][:position_b]
    )
    @conversation.invite_code = generate_invite_code
    if @conversation.save
      unless params[:conversation][:add_me_to_conversation].eql?("0")
        current_user.add_to_conversation(cid: @conversation.id, participating: true)
      end
      
      flash[:notice] = "Conversation created"
      redirect_to conversation_path(@conversation)
    else
      render :new
    end
  end

  def conversation_add_user_path
    unless current_user
      flash[:notice] = "You've been invited to a conversation! Create an account and start engaging!"
      redirect_to new_user_registration_path
    else
      # current_user.add_to_conversation(cid:, participating:, side: nil)
    end
  end

  private 


  def generate_invite_code
    loop do
      @code = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
      break unless Conversation.pluck(&:invite_code).include?(@code)
    end
    @code
  end
end
