# app/controllers/admin/admin_controller.rb
module Admin
  # AdminController
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :restric_area
    layout 'admin'

    private

    def restric_area
      redirect_to root_path unless current_user.admin?
    end
  end
end
