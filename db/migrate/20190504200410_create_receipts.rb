class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :name
      t.string :cpf
      t.string :customer_name
      t.string :customer_cpf
      t.decimal :total, precision: 14, scale: 2
      t.string :services
      t.string :location
      t.date :date
      t.belongs_to :user, foreign_key: true
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
