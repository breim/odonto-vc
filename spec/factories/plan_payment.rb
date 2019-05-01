# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :plan_payment do
    price { 6990 }
    user
  end
end
