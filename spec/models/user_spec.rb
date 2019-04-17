# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:facebook_provider) { create :oauth_provider, name: 'facebook' }

  describe 'associations' do
    it { is_expected.to have_many :customers }
    it { is_expected.to have_many :consultations }
    it { is_expected.to have_many :tickets }
    it { is_expected.to have_many :plan_payments }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    
    it 'test build token' do
      user_1 = User.new
      expect(user_1.build_token).to eq user_1.token
    end
  end
end
