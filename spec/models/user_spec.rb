# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:facebook_provider) { build_stubbed :facebook_provider }

  describe 'associations' do
    it { is_expected.to have_many :customers }
    it { is_expected.to have_many :consultations }
    it { is_expected.to have_many :tickets }
    it { is_expected.to have_many :plan_payments }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    
    it 'when create user generate oauth token' do
      user = build(:user)
      expect(user.build_token).to eq user.token
    end

    it 'when user login with facebook #from_omniauth' do
     # a = build_stubbed(:facebook_provider)
     # puts a.inspect
     # puts "============="
    end
  end
end
