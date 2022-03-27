class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum domain: [ :politics, :culture, :art, :entertainment ]

  has_many :conversations

  validates :title, presence: true, uniqueness: true
end
