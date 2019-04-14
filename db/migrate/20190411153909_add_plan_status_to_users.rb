class AddPlanStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :plan_status, :boolean, default: false
    add_column :users, :plan_date, :date
    add_column :users, :card_id, :string
    add_column :users, :card_brand, :string
    add_column :users, :card_last_digits, :string
    add_column :users, :card_expiration, :string
  end
end
