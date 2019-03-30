# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    dashboard_calendars_path(resource)
  end
end
