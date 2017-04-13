class AddMsgToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :msg, :string
  end
end
