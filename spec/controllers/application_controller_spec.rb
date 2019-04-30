# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before do
    @user = create(:user)
  end

  describe '#after_sign_in_path_for' do
    it 'redirects to the /dashboard/calendars page' do
      expect(controller.send(:after_sign_in_path_for, @user)).to eq(dashboard_calendars_path)
    end
  end
end
