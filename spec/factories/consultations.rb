# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :consultation do
    date { Date.today }
    hour { '18:00' }
    duration { '00:25' }
    user
    customer
  end
end
