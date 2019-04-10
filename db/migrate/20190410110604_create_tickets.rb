class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.string :phone
      t.string :email
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
