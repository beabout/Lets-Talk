class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :conversation_instances, class_name: 'ConversationParticipant', dependent: :destroy
  # has_many :conversations, through: :conversation_instances

  validates :email, presence: true, uniqueness: true

  def participations
    conversations(participating: true)
  end

  def following_conversations
    conversations(participating: false)
  end

  def conversations(participating:)
    # Conversation.joins(:conversation_instances).where("participating_user = #{participating} AND user_id = #{self.id}")
    conversation_instances.where(participating_user: participating).map(&:conversation)
  end

  def add_to_conversation(cid:, participating:, side: nil)
    self.conversation_instances
        .create(
          conversation_id: cid, 
          participating_user: participating, 
          left_side: side
        )
  end
end