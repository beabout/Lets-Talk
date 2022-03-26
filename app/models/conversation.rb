class Conversation < ApplicationRecord
  belongs_to :topic
  has_and_belongs_to_many :users
end
