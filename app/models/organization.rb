class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user

  has_many :questions
  has_many :votings
  has_many :rankings
  has_many :ideas
end
