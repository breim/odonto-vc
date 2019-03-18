require 'application_responder'

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  private

  def after_sign_in_path_for(_resource)
    session[:previous_url] || dashboard_calendars_path
  end
end
