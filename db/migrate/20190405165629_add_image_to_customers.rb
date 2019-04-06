class AddImageToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :image_file_name, :string
    add_column :customers, :image_content_type, :string
    add_column :customers, :image_file_size, :integer
    add_column :customers, :image_updated_at, :datetime
    add_column :customers, :image_base64, :text
  end
end
