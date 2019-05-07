# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CustomersController, type: :controller do
  let(:user) { create(:user) }
  let(:customers) { create_list(:customer, 5, user_id: user.id) }
  let(:customer) { create(:customer, user_id: user.id) }

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
    it 'new customer render view' do
      get :new, xhr: true
      expect(response.content_type).to eq 'text/javascript'
    end
  end

  describe 'GET #edit' do
    it 'edit customer render view' do
      get :edit, params: { id: customer.id }, xhr: true
      expect(response.content_type).to eq 'text/javascript'
    end
  end

  describe 'POST #create' do
    let(:customer) { attributes_for(:customer) }

    it 'create customer with success' do
      post :create, params: { customer: customer }, xhr: true
      expect(response.content_type).to eq 'text/javascript'
      expect(response.status).to eq(200)
    end
  end

  describe 'PATCH #update' do
    let(:customer) { create(:customer) }

    it 'create customer with success' do
      patch :update, params: { id: customer.id, customer: { name: 'Batman' } }, xhr: true
      expect(assigns(:customer).name).to eq('Batman')
    end
  end

  describe 'delete #destroy' do
    let(:customer) { create(:customer) }

    it 'deleted customer with success' do
      delete :destroy, params: { id: customer.id }, xhr: true
      expect(assigns(:customer).deleted).to eq(true)
    end
  end
end
