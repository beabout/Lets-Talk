class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :conversation

  validates :author, presence: true

  def time_and_sender
    "#{author.email} | #{created_at.strftime("%k:%M:%S")}"
  end
end
