class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false

      t.references :doctor_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
