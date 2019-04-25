# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    birthday { Date.today - 20.years }
    celphone { Faker::PhoneNumber.cell_phone }
    phone { Faker::PhoneNumber.cell_phone }
    user_id { SecureRandom.hex(16) }
    gender { 'M' }
    email { Faker::Internet.email }
    code { '21123312' }
    zipcode { Faker::Address.zip }
    address { Faker::Address.street_address }
    distric { Faker::Address.community }
    state { Faker::Address.state }
    city { Faker::Address.city }
    complement { Faker::Address.secondary_address }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    image { fixture_file_upload(Rails.root.join('public', 'missing_customer.png'), 'image/png') }
    user
  end
end
