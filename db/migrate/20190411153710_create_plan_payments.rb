class CreatePlanPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_payments do |t|
      t.belongs_to :user, foreign_key: true
      t.string :pagarme_transaction_id
      t.string :card_brand
      t.string :card_last_digits
      t.decimal :price, precision: 14, scale: 2

      t.timestamps
    end
  end
end
