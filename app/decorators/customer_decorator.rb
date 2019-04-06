# frozen_string_literal: true

class CustomerDecorator < ApplicationDecorator
  delegate_all

  def age
    return nil if birthday.nil?

    now = Time.now.utc.to_date
    total_age = now.year - birthday.year - (now.month > birthday.month || now.month == birthday.month && now.day >= birthday.day ? 0 : 1)
    "#{total_age} anos"
  end
end
