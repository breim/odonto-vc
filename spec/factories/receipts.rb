# frozen_string_literal: true

FactoryBot.define do
  factory :receipt do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    customer_name { Faker::Name.name }
    customer_cpf { Faker::IDNumber.brazilian_citizen_number }
    total { '9.99' }
    services { 'Odontologia' }
    location { Faker::Address.street_address }
    date { Date.today }
    deleted { false }
    user
  end
end
