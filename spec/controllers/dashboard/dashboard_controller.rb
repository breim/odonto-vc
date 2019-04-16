# frozen_string_literal: true

RSpec.describe Dashboard::DashboardController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_disabled) { create(:user, disabled: true) }

  describe 'authenticate_user helper' do
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

  describe 'disabled_or_blocked_user' do
    context 'when user logged but disabled flag enabled' do
      before do
        sign_in user_disabled
      end

      it 'return signed out user' do
        sign_out user_disabled
        expect(subject.root_path).to eq('/')
        expect(controller.send(:user_signed_in?)).to be_falsey
      end
    end
  end
end
