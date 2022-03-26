class Topic < ApplicationRecord
  enum type: [:political, :culture, :art, :entertainment]

  has_many :conversations
end
