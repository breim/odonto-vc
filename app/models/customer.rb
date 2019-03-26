# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user

  include PgSearch
  pg_search_scope :search, against: %i[name celphone cpf],
                                    using: {
                                      tsearch: { prefix: true }
                                    }
end
