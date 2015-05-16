require 'rails_helper'

describe OrganizationFollower do 
  describe 'validations' do
    it { is_expected.to validate_presence_of :organization_id }
    it { is_expected.to validate_presence_of :follower_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :organization }
    it { is_expected.to belong_to :follower }
  end
end
