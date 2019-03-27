# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def facebook_image
    "https://graph.facebook.com/#{object.uid}/picture?type=normal"
  end
end
