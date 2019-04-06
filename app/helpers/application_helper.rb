# frozen_string_literal: true

module ApplicationHelper
  def current_link_helper(path)
    'active' if controller_name == path
  end

  def badge_status(status)
    return "<span class='badge badge-success'>Active</span>".html_safe if status.eql? true
    return "<span class='badge badge-danger'>Inactive</span>".html_safe if status.eql? false
  end
end
