# frozen_string_literal: true

# app/controllers/admin/admin_controller.rb
module Dashboard
  # DashboardController
  class DashboardController < ApplicationController
    before_action :authenticate_user!
  end
end
