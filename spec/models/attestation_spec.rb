# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attestation, type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:customer_name) }
    it { should validate_presence_of(:fit_unfit) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:hour) }
    it { should validate_presence_of(:cro) }
    it { should validate_presence_of(:work_or_study) }
  end
end
