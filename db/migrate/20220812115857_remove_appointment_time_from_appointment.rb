class RemoveAppointmentTimeFromAppointment < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :appointment_time, :datetime
  end
end
