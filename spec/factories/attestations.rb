# frozen_string_literal: true

FactoryBot.define do
  factory :attestation do
    name { Faker::FunnyName.two_word_name }
    address { Faker::Address.street_name }
    work_or_study { 'study' }
    customer_name { Faker::FunnyName.two_word_name }
    date { Date.today }
    hour { '10:00' }
    fit_unfit { 'unfit' }
    observation { Faker::Lorem.paragraph }
    deleted { false }
    cro { '102021' }
    unfit_days { '1' }
    user
  end
end
