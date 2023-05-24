class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: true, null:false
      t.references :patient, foreign_key: true, null:false
      t.datetime :appointment_datetime, null: false
      t.text :recommendation
      t.string :status, null:false, default: 'open'
      t.timestamps
    end
  end
end
