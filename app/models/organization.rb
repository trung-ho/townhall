class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :banner, CoverImageUploader
  
  belongs_to :user

  has_many :questions
  has_many :votings
  has_many :rankings
  has_many :ideas

  validates :slug, uniqueness: true
  validates_format_of :slug, :with => /^[a-z0-9-]+$/, multiline: true, :message => "can't contain any spaces or special characters"

end
