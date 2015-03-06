class Organization < ActiveRecord::Base
  belongs_to :user

  has_many :questions
  has_many :votings
  has_many :rankings
  has_many :ideas
end
