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

  factory :user_desactived, class: User do |f|
    email { Faker::Internet.free_email + SecureRandom.hex(4).to_s }
    password { Faker::Internet.password }
    token { SecureRandom.hex(16) }
    disabled { true }
  end
end
