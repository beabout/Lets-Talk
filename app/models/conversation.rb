class Conversation < ApplicationRecord
  extend FriendlyId
  friendly_id :invite_code

  belongs_to :topic
  belongs_to :creator, class_name: 'User'
  has_many :conversation_participants, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :topic, presence: true
  validates :position_a, presence: true
  validates :position_b, presence: true
  validates :creator, presence: true

  # after_create_commit { broadcast_append_to "conversations" }

  def title
    topic.title
  end
  
  def domain
    topic.domain
  end
  
  def users(participating:)
    User.joins(:conversation_instances).where("participating_user = #{participating} AND conversation_id = #{self.id}")
  end

  def simple_participants
    participants.map(&:username).join(", ")
  end
  
  def participants
    users(participating: true)
  end
  
  def followers
    users(participating: false)
  end

  def positions
    { 
      left: position_a, 
      right: position_b
    }
  end

  def invite_link
    return "#{ENV["APPLICATION_URL"]}/conversations/#{invite_code}/add_user"
  end

  def method_name(conversation:)
    ConversationParticipant.create(conversation: conversation, user: self)
  end
  
  def add_me_to_conversation=(value);end
  def add_me_to_conversation;end
end
