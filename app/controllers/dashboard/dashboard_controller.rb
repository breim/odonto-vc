# frozen_string_literal: true

# app/controllers/dashboard/dashboard_controller.rb
module Dashboard
  # DashboardController
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :disabled_user

    layout 'dashboard'

    private

    def disabled_user
      return false unless current_user.disabled?

      sign_out current_user
      redirect_to root_path, flash: { notice: 'Sua conta foi desabilitada.' }
    end
  end
end
