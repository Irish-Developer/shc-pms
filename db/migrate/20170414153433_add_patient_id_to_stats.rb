class AddPatientIdToStats < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :patient_id, :integer
  end
end
