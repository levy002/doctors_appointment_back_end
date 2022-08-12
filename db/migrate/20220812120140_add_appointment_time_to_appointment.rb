class AddAppointmentTimeToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :appointment_time, :datetime
  end
end
