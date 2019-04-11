# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user, optional: true

  self.per_page = 15

  include PgSearch
  pg_search_scope :search, against: %i[name phone email],
                           using: {
                             tsearch: { prefix: true }
                           }
end
