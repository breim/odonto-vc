# frozen_string_literal: true

class PlanPayment < ApplicationRecord
  belongs_to :user

  usar_como_dinheiro :price

  def self.bill_card(card_hash_or_id)
    PagarMe.api_key = ENV['pagarme_api_key']
    transaction = if card_hash_or_id.length > 40
      PagarMe::Transaction.new(amount: ENV['plan_price'], card_hash: card_hash_or_id)
    else
      PagarMe::Transaction.new(amount: ENV['plan_price'], card: PagarMe::Card.find_by_id(card_hash_or_id))
    end
    transaction.charge
  end
end
