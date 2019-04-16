# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CalendarsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    context 'with user not logged' do
      it 'return 401 error' do
        get :index
        expect(response.status).to eq(302)
      end
    end

    context 'with user loged in' do
      it 'return 200 status code' do
        sign_in user
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end
