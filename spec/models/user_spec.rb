# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :customers }
    it { is_expected.to have_many :consultations }
    it { is_expected.to have_many :tickets }
    it { is_expected.to have_many :plan_payments }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'self methods' do
    it 'when create user generate oauth token' do
      user = build(:user)
      expect(user.build_token).to eq user.token
    end
  end
end
