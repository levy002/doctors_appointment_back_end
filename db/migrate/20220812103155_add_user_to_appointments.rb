class AddUserToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :user, null: false, foreign_key: true
  end
end
