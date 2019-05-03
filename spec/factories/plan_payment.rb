# frozen_string_literal: true

FactoryBot.define do
  factory :plan_payment do
    price { 6990 }
    user
  end
end
