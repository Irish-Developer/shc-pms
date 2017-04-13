class AddEmailToClinics < ActiveRecord::Migration[5.0]
  def change
    add_column :clinics, :email, :string
  end
end
