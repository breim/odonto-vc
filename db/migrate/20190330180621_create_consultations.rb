class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.date :date
      t.string :hour
      t.string :duration
      t.text :annotation
      t.boolean :deleted, default: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.boolean :canceled, default: false
      t.boolean :sms_sent, default: false
      t.date :sms_date

      t.timestamps
    end
  end
end
