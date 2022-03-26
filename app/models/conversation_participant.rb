class ConversationParticipant < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :conversation, uniqueness: { scope: :user }
end
