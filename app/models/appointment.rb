class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :city, presence: true, length: { minimum: 3, maximum: 15 }
  validates :appointment_time, presence: true
end
