# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.free_email + SecureRandom.hex(4).to_s }
    f.password { Faker::Internet.password }
    f.token { SecureRandom.hex(16) }
    f.disabled { false }
  end

  factory :user_desactived, class: User do |f|
    f.email { Faker::Internet.free_email + SecureRandom.hex(4).to_s }
    f.password { Faker::Internet.password }
    f.token { SecureRandom.hex(16) }
    f.disabled { true }
  end
end
