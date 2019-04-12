# frozen_string_literal: true

# Extend module
module Dashboard
  # Controller
  class PlansController < Dashboard::DashboardController
    def index; end

    def create
      @transaction = PlanPayment.bill_card(params[:pagarme][:card_hash])

      if @transaction.status == 'paid'
        current_user.update(card_hash: params[:pagarme][:card_hash], card_brand: @transaction.card.brand, card_last_digits: @transaction.card.last_digits,
                            card_expiration: @transaction.card.expiration_date, plan_date: Date.today, plan_status: true)

        PlanPayment.create(user_id: current_user.id, pagarme_transaction_id: @transaction.id, card_brand: @transaction.card.brand,
                           card_last_digits: @transaction.card.last_digits, price: ENV['plan_price'].to_f / 100)

        respond_with(current_user, location: dashboard_plans_path, notice: 'Sua assinatura foi realizada com sucesso!! <3')
      else
        # Criar callback para me notificar quando a transacao nao passar (assim entramos em contato com o usuario e concluirmos a compra)
        flash[:error] = 'Ops! Não conseguimos efetuar a cobrança em seu cartão. Tente novamente com um novo cartão ou contate sua operadora.'
        respond_with(current_user, location: dashboard_plans_path)
      end
    end

    def destroy
      current_user.update(plan_status: false)
      respond_with(current_user, location: dashboard_plans_path, notice: 'Plano cancelado com sucesso')
    end
  end
end
