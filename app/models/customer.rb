# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user

  before_save :build_cpf
  validates :name, presence: true

  self.per_page = 25

  include PgSearch
  pg_search_scope :search, against: %i[name celphone cpf],
                           using: {
                             tsearch: { prefix: true }
                           }

  def build_cpf
    return false if cpf.nil?
    cpf.gsub!(/\D/, '')
  end
end
