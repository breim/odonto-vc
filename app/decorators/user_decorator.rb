# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def created_last_week
    object.where('created_at >= ?', 1.week.ago.utc).count
  end

  def image
    if object.uid.nil?
      "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(object.email)}?s=150"
    else
      "https://graph.facebook.com/#{object.uid}/picture?type=normal"
    end
  end
end
