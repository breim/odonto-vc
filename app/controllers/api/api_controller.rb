# frozen_string_literal: true

# app/controllers/api/api_controller.rb
module Api
  # ApiController
  class ApiController < ApplicationController
    protect_from_forgery

    # Object not found
    rescue_from ActiveRecord::RecordNotFound, with: :object_not_found

    # Disable Cors
    before_action :cors_preflight_check
    after_action :cors_set_access_control_headers
    skip_before_action :verify_authenticity_token

    private

    def render_error_quota
      render body: 'You do not have enough quotas to create this record, please contact our support to get more quotas', status: 401
    end

    def object_not_found
      render body: 'Object not found', status: 403
    end

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def cors_preflight_check
      return unless request.method == 'OPTIONS'

      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
      render text: '', content_type: 'text/plain'
    end
  end
end
