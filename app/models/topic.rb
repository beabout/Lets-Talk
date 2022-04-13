class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum domain: [ 
    :politics, 
    :arts_and_culture, 
    :entertainment, 
    :sports,
    :history,
    :nature,
    :religion_and_spirituality,
    :technology
  ]

  has_many :conversations

  validates :title, presence: true, uniqueness: true
end
