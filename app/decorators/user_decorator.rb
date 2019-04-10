# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def created_last_week
    object.where("created_at >= ?", 1.week.ago.utc).count
  end

  def facebook_image
    "https://graph.facebook.com/#{object.uid}/picture?type=normal"
  end
end
