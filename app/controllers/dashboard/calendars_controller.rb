# Extend module
module Dashboard
  # Controller
  class CalendarsController < Dashboard::DashboardController
    def index; end

    def search
      @customers = Customer.joins(:user).where(user_id: current_user.id, deleted: false).search_customer(params[:search])
                           .order('created_at desc').limit(15)
    end
  end
end
