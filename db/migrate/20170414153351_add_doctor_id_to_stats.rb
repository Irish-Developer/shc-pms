class AddDoctorIdToStats < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :doctor_id, :integer
  end
end
