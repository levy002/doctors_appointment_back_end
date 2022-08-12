class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :city
      t.datetime :appointment_time

      t.timestamps
    end
  end
end
