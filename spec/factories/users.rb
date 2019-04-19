# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email + SecureRandom.hex(4).to_s }
    password { Faker::Internet.password }
    token { SecureRandom.hex(16) }
    disabled { false }
  end

  factory :facebook_provider do
    provider { 'facebook' }
    uid { '102020' }
    info {
      email { Faker::Internet.free_email }
      name { Faker::Name.name }
      first_name { Faker::Name.name }
      last_name { Faker::Name.name }
      image { Faker::Avatar.image }
    }
  end
end
