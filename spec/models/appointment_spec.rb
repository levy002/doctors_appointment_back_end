require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:doctor) { Doctor.create(name: 'Rida Arif', image: 'ghghghghghghghgh', fee: 15, details: "Hi, I am a doctor.")}
  let(:user) { User.create(name: 'Arif')}
  let(:appointment) { Appointment.create(city: 'Pfungstadt', appointment_time: Time.current, user_id: user.id, doctor_id: doctor.id)}

  it 'should be valid' do
    expect(appointment).to be_valid
  end
  it 'should not be valid' do
    appointment.city= nil
    expect(appointment).to_not be_valid
  end
  it 'should not be valid' do
    appointment.appointment_time= nil
    expect(appointment).to_not be_valid
  end

end
