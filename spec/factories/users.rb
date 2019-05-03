# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{SecureRandom.hex(9)}@example.com" }
    password { Faker::Internet.password }
    token { SecureRandom.hex(16) }
    disabled { false }
  end
end
