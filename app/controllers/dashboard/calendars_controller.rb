# frozen_string_literal: true

# Extend module
module Dashboard
  # Controller
  class CalendarsController < Dashboard::DashboardController
    def index
      @customers = Customer.joins(:user).where(user_id: current_user.id, deleted: false).search(params[:search])
                           .order('created_at desc').limit(15).decorate if params[:search]
    end
  end
end
