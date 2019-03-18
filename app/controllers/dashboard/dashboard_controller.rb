# frozen_string_literal: true

# app/controllers/admin/admin_controller.rb
module Admin
  # AdminController
  class AdminController < ApplicationController
    before_action :authenticate_user!
  end
end
