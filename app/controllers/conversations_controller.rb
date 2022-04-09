class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.order(likes: :desc)
  end

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
      if params[:conversation][:add_me_to_conversation]
        current_user.add_to_conversation(conversation: @conversation)
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
      current_user.add_me_to_conversation
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
