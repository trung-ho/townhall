require 'rails_helper'

describe Follow do 
  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :organization_id }
    it { is_expected.to validate_presence_of :receive_app_notifications }
    it { is_expected.to validate_presence_of :receive_email }
  end

  describe 'associations' do 
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :organization }
  end
end
