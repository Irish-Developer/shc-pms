class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :fname
      t.string :lname
      t.string :email

      t.timestamps
    end
  end
end
