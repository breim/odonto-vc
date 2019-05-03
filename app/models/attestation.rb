# frozen_string_literal: true

class Attestation < ApplicationRecord
  belongs_to :user

  validates :name, :customer_name, :fit_unfit, :date, :hour,
            :cro, :work_or_study, presence: true

  after_create :update_cro_and_address

  self.per_page = 15

  include PgSearch
  pg_search_scope :search, against: %i[customer_name],
                           using: {
                             tsearch: { prefix: true }
                           }

  private

  def update_cro_and_address
    user.update(cro: cro, address: address)
  end
end
