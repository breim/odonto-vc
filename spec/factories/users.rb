# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    token { SecureRandom.hex(16) }
    disabled { false }
  end
end
