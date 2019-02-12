# frozen_string_literal: true

module Api
  class UsersController < Api::ApiController
    def create
      @user = User.from_omniauth(params[:auth])
      render json: @user, adapter: :json
    end
  end
end
