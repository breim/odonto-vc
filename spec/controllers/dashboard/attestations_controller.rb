# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::AttestationsController, type: :controller do
  let(:user) { create(:user) }
  let(:attestations) { create_list(:attestation, 5, user_id: user.id) }
  let(:attestation) { create(:attestation, user_id: user.id) }
  let(:attestation_attributes) { attributes_for(:attestation) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'return some attestations' do
      get :index
      expect(assigns(:attestations)).to match_array(attestations)
    end

    it 'search attestation name' do
      attestation = attestations.first
      get :index, params: { search: attestation.customer_name }, xhr: true
      expect(assigns(:attestations)).to include(attestation)
    end
  end

  describe 'GET #show' do
    it 'new attestation render view' do
      get :show, params: { id: attestation.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'new attestation render view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'edit attestation render view' do
      get :edit, params: { id: attestation.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    it 'create attestation with success' do
      post :create, params: { attestation: attestation_attributes }
      controller.current_user.reload
      expect(assigns(:attestation).name).to eq(attestation_attributes[:name])
      expect(controller.current_user.cro).to eq(attestation_attributes[:cro])
      expect(controller.current_user.address).to eq(attestation_attributes[:address])
    end
  end

  describe 'PATCH #update' do
    it 'create attestation with success' do
      patch :update, params: { id: attestation.id, attestation: { customer_name: 'Batman' } }
      expect(assigns(:attestation).customer_name).to eq('Batman')
    end
  end

  describe 'delete #destroy' do
    it 'deleted attestation with success' do
      delete :destroy, params: { id: attestation.id }
      expect(assigns(:attestation).deleted).to eq(true)
    end
  end
end
