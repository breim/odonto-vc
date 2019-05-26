# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CalendarsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_disabled) { create(:user, disabled: true) }
  let(:customer) { create(:customer, user_id: user.id) }

  describe 'GET #index' do
    before do
      sign_in user
    end

    it 'return 200 params' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'return 200 status code' do
      get :index, params: { search: customer.name }, xhr: true
      expect(assigns(:customers)).to include(customer)
    end
  end

  describe 'GET #index with disabled user' do
    before do
      sign_in user_disabled
    end

    it 'return 200 params' do
      get :index
      expect(response.status).to eq(302)
    end
  end
end
