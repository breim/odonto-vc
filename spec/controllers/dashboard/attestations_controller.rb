# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::AttestationsController, type: :controller do
  let(:user) { create(:user) }
  let(:attestations) { create_list(:attestation, 5, user_id: user.id) }
  let(:customer) { create(:customer, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'return some attestations' do
      get :index
      expect(assigns(:attestations)).to match_array(attestations)
    end

    it 'search customer name' do
      attestation = attestations.first
      get :index, params: { search: attestation.customer_name }, xhr: true
      expect(assigns(:attestations)).to include(attestation)
    end
  end

  describe 'GET #new' do
    it 'new customer render view' do
    #  get :new, xhr: true
    #  expect(response.content_type).to eq 'text/javascript'
    end
  end

  describe 'GET #edit' do
    it 'edit customer render view' do
    #  get :edit, params: { id: customer.id }, xhr: true
    #  expect(response.content_type).to eq 'text/javascript'
    end
  end

  describe 'POST #create' do
    let(:customer) { attributes_for(:customer) }

    it 'create customer with success' do
    #  post :create, params: { customer: customer }, xhr: true
    #  expect(response.content_type).to eq 'text/javascript'
    #  expect(response.status).to eq(200)
    end
  end

  describe 'PATCH #update' do
    let(:customer) { create(:customer) }

    it 'create customer with success' do
    #  patch :update, params: { id: customer.id, customer: { name: 'Batman' } }, xhr: true
    #  expect(assigns(:customer).name).to eq('Batman')
    end
  end

  describe 'delete #destroy' do
    let(:customer) { create(:customer) }

    it 'create customer with success' do
    #  delete :destroy, params: { id: customer.id }, xhr: true
    #  expect(assigns(:customer).deleted).to eq(true)
    end
  end
end
