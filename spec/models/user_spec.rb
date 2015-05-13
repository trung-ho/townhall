require 'rails_helper'

describe User do
  describe 'validations' do
    it { is_expected.to enumerize(:gender).in(:male, :female) }
  end
end