class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: true, null:false
      t.references :patient, foreign_key: true, null:false
      t.datetime :appointment_date, null:false

      t.timestamps
    end
  end
end
