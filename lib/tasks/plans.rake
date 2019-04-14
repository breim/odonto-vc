# frozen_string_literal: true

namespace :plans do
  task renew: :environment do
    @users = User.where(plan_status: true, plan_date: Date.today-1.month)

    next if @users.empty?

    @users.each do |user|
      transaction = PlanPayment.bill_card(user.card_id)
      if transaction.status == 'paid'
        user.update(plan_date: Date.today)
        PlanPayment.create(user_id: user.id, pagarme_transaction_id: transaction.id, card_brand: transaction.card.brand,
                           card_last_digits: transaction.card.last_digits, price: ENV['plan_price'].to_f / 100)
      else
        # Criar email informando que nao foi autorizada a transacao. Mandar no minimo 3 emails no futuro.
        user.update(plan_status: false)
      end
    end
  end
end