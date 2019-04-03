class AddColorToConsultation < ActiveRecord::Migration[5.2]
  def change
    add_column :consultations, :color, :string
  end
end
