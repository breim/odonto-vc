# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::CalendarsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:customer) { create(:customer, user_id: user.id) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    context 'only get' do
      it 'return 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'get with search params to find customers' do
      it 'return 200 status code' do
        @customers = Customer.joins(:user).where(user_id: user.id, deleted: false).search(customer.name)
        expect(@customers).to eq([customer])
      end
    end
  end
end
