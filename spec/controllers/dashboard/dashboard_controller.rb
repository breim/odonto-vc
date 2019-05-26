# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dashboard::DashboardController, type: :controller do
  let(:user) { create(:user) }

  describe '#authenticate_user!' do
    context 'with user logged in' do
      before do
        sign_in user
      end

      it 'returns true' do
        expect(controller.send(:user_signed_in?)).to be_truthy
      end
    end

    context 'without user logged in' do
      it 'returns false' do
        expect(controller.send(:user_signed_in?)).to be_falsey
      end
    end
  end
end
