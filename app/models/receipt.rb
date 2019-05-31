# frozen_string_literal: true

class Receipt < ApplicationRecord
  belongs_to :user

  self.per_page = 15
end
