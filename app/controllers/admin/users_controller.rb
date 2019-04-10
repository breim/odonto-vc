# Extend module
module Admin
  # Controller
  class UsersController < Admin::AdminController
    before_action :set_user, only: %i[show edit update]

    respond_to :html

    def index
      @users = if params[:search].present?
                 User.search(params[:search]).paginate(page: params[:page])
               else
                 User.paginate(page: params[:page]).order(created_at: :desc)
               end
      respond_with(@users, location: admin_users_path)
    end

    def show
      respond_with(@user)
    end

    def edit; end

    def update
      @user.update(user_params)
      respond_with(@user)
    end

    def destroy; end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :cpf, :celphone, :email,
                                   :cro, :address, :admin, :plan_id, :plan_date, :blocked)
    end
  end
end
