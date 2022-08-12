class AddDoctorToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :doctor, null: false, foreign_key: true
  end
end
