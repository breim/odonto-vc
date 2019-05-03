class CreateAttestations < ActiveRecord::Migration[5.2]
  def change
    create_table :attestations do |t|
      t.string :name
      t.string :address
      t.string :work_or_study
      t.string :customer_name
      t.date :date
      t.string :hour
      t.string :fit_unfit
      t.string :observation
      t.boolean :disabled, default: false
      t.string :cro
      t.string :unfit_days
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
