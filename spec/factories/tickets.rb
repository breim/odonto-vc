# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :ticket do
    name { Faker::Name.name }
    description { Faker::ChuckNorris.fact }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
