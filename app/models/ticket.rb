class Ticket < ApplicationRecord
  belongs_to :user, optional: true

  include PgSearch
  pg_search_scope :search, against: %i[name celphone email],
                           using: {
                             tsearch: { prefix: true }
                           }
end
