# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CalendarsController, type: :controller do
  let(:user) { create(:user) }
  let(:customer) { create(:customer, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'return 200 params' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'return 200 status code' do
      get :index, params: { search: customer.name }, xhr: true
      expect(assigns(:customers)).to include(customer)
    end
  end
end
