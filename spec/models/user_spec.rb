require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Rida Arif') }

  describe 'Validations' do
    it 'should not be nil' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'should not be nil' do
      expect(user).to be_valid
    end
    it 'should not be nil' do
      user.name = 'Ridaaaaaaaaaaaaaaaaaaaaaaaa'
      expect(user).to_not be_valid
    end
  end
end
