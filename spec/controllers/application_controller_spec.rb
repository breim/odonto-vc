# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create(:user) }

  before do
    # sign_in user
  end

  it 'redirect user after login #after_sign_in_path_for' do
    # expect(response).to redirect_to(dashboard_controllers_path)
    # expect(controller.send(:user_signed_in?)).to be_truthy
  end
end
