require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { Doctor.create(name: 'Rida Arif', image: 'ghghghghghghghgh', fee: 15, details: 'Hi, I am a doctor.') }

  describe 'Validations' do
    it 'should not be nil' do
      doctor.name = nil
      expect(doctor).to_not be_valid
    end

    it 'should be valid' do
      expect(doctor).to be_valid
    end

    it 'should not be valid' do
      doctor.image = ''
      expect(doctor).to_not be_valid
    end

    it 'should not be valid' do
      doctor.fee = 8
      expect(doctor).to_not be_valid
    end
    it 'should not be valid' do
      doctor.details = ''
      expect(doctor).to_not be_valid
    end

    it 'should not be valid' do
      doctor.name = 'Ridaaaaaaaaaaaaaaaaaaaaaaaa'
      expect(doctor).to_not be_valid
    end
  end
end
