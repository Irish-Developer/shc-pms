class AddConditionToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :condition, :string
  end
end
