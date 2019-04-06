# frozen_string_literal: true

class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :customer
end
