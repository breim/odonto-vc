# frozen_string_literal: true

class PlanPayment < ApplicationRecord
  belongs_to :user

  usar_como_dinheiro :price

  def self.bill_card(card_hash)
    PagarMe.api_key = ENV['pagarme_api_key']
    transaction = PagarMe::Transaction.new(
      amount: ENV['plan_price'], card_hash: card_hash
    )
    transaction.charge
  end
end
