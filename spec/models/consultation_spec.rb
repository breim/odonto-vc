# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Consultation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :customer }
  end

  describe 'methods' do
    let(:consultation) { create(:consultation) }

    context '#send_sms' do
      it 'successful send message' do
      end

      it 'account dont have credits' do
        VCR.use_cassette('consultation/no_credits', match_requests_on: %i[method host path]) do
          expect(JSON.parse(consultation.send_sms)).to include_json(
            status: 0, data: nil, msg: 'SEM CREDITOS PARA ENVIO DA CAMPANHA'
          )
        end
      end
    end
  end
end
