class Follow < ActiveRecord::Base
  belongs_to :user 
  belongs_to :organization

  validates :user_id,                   presence: true
  validates :organization_id,           presence: true
  validates :receive_app_notifications, presence: true
  validates :receive_email,             presence: true

  validates_associated :user, :organization
end
