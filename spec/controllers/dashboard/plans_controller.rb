# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::PlansController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'return 200 params' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    let(:card_hash) { { card_hash: 'card_cjva5883c072hsn6dwdeehjjb' } }

    before do
      VCR.use_cassette('card_hash') do
        @transaction = PlanPayment.bill_card(card_hash[:card_hash])
      end
    end

    it 'when trasaction is paid status' do
      VCR.use_cassette('card_hash') do
        post :create, params: { pagarme: { card_hash: @transaction.card.id } }
      end
      expect(controller.current_user.plan_status).to eq(true)
      expect(response).to redirect_to(dashboard_plans_path)
    end

    it 'transaction dont paid or card_hash is invalid' do
      VCR.use_cassette('card_hash_invalid') do
        post :create, params: { pagarme: { card_hash: 'sasasad' } }
      end
      expect(controller.current_user.plan_status).to eq(false)
      expect(response).to redirect_to(dashboard_plans_path)
    end
  end

  describe 'POST #create' do
    before do
      controller.current_user.update(plan_status: true)
    end

    it 'create customer with success' do
      delete :destroy, params: { id: user.id }
      expect(controller.current_user.plan_status).to eq(false)
    end
  end
end
