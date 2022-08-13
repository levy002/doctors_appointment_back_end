require 'rails_helper'

describe 'doctors API', type: :request do
  describe 'GET /doctors' do
    before do
      FactoryBot.create(:doctor, name: 'Doctor-1', fee: 20, image: 'Doctor-1-photo', details: 'I am Doctor-1')
      FactoryBot.create(:doctor, name: 'Doctor-2', fee: 30, image: 'Doctor-2-photo', details: 'I am Doctor-2')
      FactoryBot.create(:doctor, name: 'Doctor-3', fee: 40, image: 'Doctor-3-photo', details: 'I am Doctor-3')
    end
    it 'returns all doctors' do
      get '/api/v1/doctors'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /doctors' do
    it 'create a new doctor' do
      expect do
        post '/api/v1/doctors', params: {
          doctor: { name: 'Doctor', fee: 20, image: 'Doctor-photo', details: 'I am Doctor' }
        }
      end.to change { Doctor.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /doctors:id' do
    let!(:doctor1) do
      FactoryBot.create(:doctor, name: 'Doctor-1', fee: 20, image: 'Doctor-1-photo', details: 'I am Doctor-1')
    end
    let!(:doctor2) do
      FactoryBot.create(:doctor, name: 'Doctor-2', fee: 30, image: 'Doctor-2-photo', details: 'I am Doctor-2')
    end
    let!(:doctor3) do
      FactoryBot.create(:doctor, name: 'Doctor-3', fee: 40, image: 'Doctor-3-photo', details: 'I am Doctor-3')
    end

    it 'delete a doctor' do
      expect do
        delete "/api/v1/doctors/#{doctor1.id}"
      end.to change { Doctor.count }.from(3).to(2)

      expect(response).to have_http_status(:ok)
    end
  end
end
