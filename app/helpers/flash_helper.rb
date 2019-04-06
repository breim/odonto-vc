# frozen_string_literal: true

# Flash helper
module FlashHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'alert alert-success'
    when :success then 'alert alert-success'
    when :error then 'alert alert-danger'
    when :alert then 'alert alert-danger'
    end
  end
end
