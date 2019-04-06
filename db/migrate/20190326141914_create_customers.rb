class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.string :code
      t.string :email
      t.string :celphone
      t.string :phone
      t.string :zipcode
      t.string :address
      t.string :number
      t.string :distric
      t.string :state
      t.string :city
      t.string :complement
      t.string :cpf
      t.string :annotation
      t.belongs_to :user, foreign_key: true
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
