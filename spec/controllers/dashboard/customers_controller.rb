# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CustomersController, type: :controller do
  let(:user) { create(:user) }
  let(:customers) { create_list(:customer, 5, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'return some customers' do
      get :index
      expect(assigns(:customers)).to match_array(customers)
    end

    it 'search customer name' do
      customer = customers.first
      get :index, params: { search: customer.name }, xhr: true
      expect(assigns(:customers)).to include(customer)
    end
  end

  describe 'GET #new' do
    it 'new customer' do
      get :new, xhr: true
      expect(response.content_type).to eq 'text/javascript'
    end
  end
end
