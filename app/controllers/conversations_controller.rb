class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.order(likes: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
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
        ConversationParticipant.create(conversation: @conversation, user: current_user)
      end
      
      flash[:notice] = "Conversation created"
      redirect_to conversation_path(@conversation)
    else
      render :new
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
