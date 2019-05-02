FactoryBot.define do
  factory :attestation do
    name { "MyString" }
    address { "MyString" }
    work_or_study { "MyString" }
    customer_name { "MyString" }
    date { "2019-05-01" }
    hour { "MyString" }
    fit_unfit { "MyString" }
    observation { "MyString" }
    disabled { false }
    cro { "MyString" }
    unfit_days { "MyString" }
    user { nil }
  end
end
