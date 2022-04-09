class MessagesController < ApplicationController
  before_action :set_conversation, only: %i[ new create ]

  def new
    @message = @conversation.messages.new
  end

  def create
    message_params[:position] = message_params[:position].to_i
    @message = @conversation.messages.create!(
      text: message_params[:text],
      position: message_params[:position].to_i, 
      author_id: current_user.id
    )

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @conversation }
    end
  end

  private 

  def set_conversation
    @conversation = Conversation.friendly.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:text, :author_id, :position, :conversation_id)
  end
end
