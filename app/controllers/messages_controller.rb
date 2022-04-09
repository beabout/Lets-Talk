class MessagesController < ApplicationController
  before_action :set_conversation, only: %i[ edit new create ]
  before_action :set_message, only: %i[ edit update ]

  def new
    @message = @conversation.messages.new
  end

  def edit
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

  def update
    @message.update(link: params[:message][:link])
    render partial: 'message', locals: { message: @message }
  end

  private 

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.friendly.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:text, :author_id, :position, :conversation_id)
  end
end
