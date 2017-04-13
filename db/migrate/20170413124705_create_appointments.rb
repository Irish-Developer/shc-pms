class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :clinic_id
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :condition_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
