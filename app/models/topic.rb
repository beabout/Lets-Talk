class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum domain: [ :politics, :culture, :art, :entertainment ]

  has_many :conversations

  validates :title, uniqueness: true

  # after_create :update_slug
  # before_update :assign_slug

  # def create_slug
  #   self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
  # end

  # def update_slug
  #   self.update(slug: assign_slug)
  # end
  
  # private
  
  # def assign_slug
  #   self.slug = create_slug
  # end
end
