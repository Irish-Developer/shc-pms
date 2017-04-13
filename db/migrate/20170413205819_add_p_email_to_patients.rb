class AddPEmailToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :p_email, :string
  end
end
