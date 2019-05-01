# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlanPayment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'self methods' do
    let(:plan_payment) { build(:plan_payment) }
    let(:card_hash) { { card_hash: 'card_cjva5883c072hsn6dwdeehjjb' } }
    let(:transaction_hash) do
      { transaction_hash: '1558669_DINiVOiY85zQhLzCa6tqcz9WDVJzpg1YZL+Et3e1NaKb4Ra1MhYNmszpFoqBykfiF3E1DQ0+' \
                          'ymeIu44lYU+msLwBqPmhUBIc6ylP6gOQ6vO8/nhlP5Mv/oStk00HoPVr8S+UXKwirt27dQivHat2PMp+' \
                          'BcaEUTcTN8FlnOD/E13ZZKJRo2/tAOmp8hy5zn6waHOM2HbQF46sChFTewgNKTPfK9Mc8lIqhtaPWdTC' \
                          '3zVwzuw4wkD3r+Lx1J3bwO1cYkDGFses0fmraErh9qc39vpLEa4sAmbOHNrUInPyoj34JXkGGLMGizzA' \
                          '7NQlPXg1x2MDvzWHoxLi+kGwNXMvCA==' }
    end

    it '#bill_card with card_hash' do
      VCR.use_cassette('card_hash') do
        expect(PlanPayment.bill_card(card_hash[:card_hash]).status).to eq('paid')
      end
    end

    it '#bill_card with transaction_hash' do
      VCR.use_cassette('transaction_hash') do
        expect(PlanPayment.bill_card(transaction_hash[:transaction_hash]).status).to eq('paid')
      end
    end
  end
end
