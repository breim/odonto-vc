class AddToUsersCroAndAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cro, :string
    add_column :users, :address, :string
  end
end
