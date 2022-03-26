class Conversation < ApplicationRecord
  belongs_to :topic
  has_many :conversation_participants, dependent: :destroy
  # has_many :users, through: :conversation_participants
  has_many :messages, dependent: :destroy

  validates :topic, presence: true

  def title
    topic.title
  end

  def domain
    topic.domain
  end

  def users(participating:)
    User.joins(:conversation_instances).where("participating_user = #{participating} AND conversation_id = #{self.id}")
  end
  
  def participants
    users(participating: true)
  end

  def followers
    users(participating: false)
  end
end
