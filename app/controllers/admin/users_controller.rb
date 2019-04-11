# frozen_string_literal: true

# Extend module
module Admin
  # Controller
  class UsersController < Admin::AdminController
    before_action :set_user, only: %i[show edit update]

    respond_to :html

    def index
      params[:page] = 1 unless params[:page].present?
      @users = if params[:search].present?
                 User.search(params[:search]).paginate(page: params[:page])
               else
                 User.paginate(page: params[:page]).order(created_at: :desc)
               end
      respond_with(@users, location: admin_users_path)
    end

    def show
      if params[:login_as_user].present?
        sign_in(:user, @user)
        redirect_to dashboard_calendars_path
      else
        respond_with(@user, location: admin_users_path)
      end
    end

    def edit; end

    def update
      params[:user].delete('password') if params[:user]['password'].blank?
      @user.update(user_params)
      respond_with(@user, location: admin_users_path, notice: 'Updated')
    end

    def destroy; end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :admin, :disabled)
    end
  end
end
