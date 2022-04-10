class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :conversation

  enum position: [:left, :center, :right]

  validates :author, presence: true

  # after_create_commit { broadcast_append_to self.room }

  def time_and_sender
    "#{author.username} | #{created_at.strftime("%l:%M%P")}"
  end
end
