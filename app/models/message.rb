class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :conversation

  validates :author, presence: true

  def time_and_sender
    "#{author.username} | #{created_at.strftime("%l:%M%P")}"
  end
end
