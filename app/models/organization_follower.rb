class OrganizationFollower < ActiveRecord::Base
  belongs_to :follower, class: User
  belongs_to :organization

  validates :organization_id,           presence: true, uniqueness: {scope: :follower_id}
  validates :follower_id,               presence: true

  validates_associated :follower, :organization

  delegate :name, to: :organization, prefix: true, allow_nil: true
end
