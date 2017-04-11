class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :address1
      t.string :address2
      t.string :phone

      t.timestamps
    end
  end
end
