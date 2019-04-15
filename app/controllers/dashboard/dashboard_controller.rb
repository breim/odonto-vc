# frozen_string_literal: true

# app/controllers/admin/admin_controller.rb
module Dashboard
  # DashboardController
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :disabled_or_blocked_user

    layout 'dashboard'

    private

    def disabled_or_blocked_user
      return false unless current_user.disabled?

      sign_out current_user
      flash[:error] = 'Sua conta foi desabilitada.'
      redirect_to root_path
    end
  end
end
