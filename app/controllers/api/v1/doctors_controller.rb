class Api::V1::DoctorsController < ApplicationController
  def index
    doctors = Doctor.all
    if doctors
      render json: { status: 'SUCCESS', data: doctors, message: 'All doctors loaded successfully!' }, status: :ok
    else
      render json: doctor.errors, status: :bad_request
    end
  end

  def show
    doctor = Doctor.find(params[:id])
    if doctor
      render json: { status: 'SUCCESS', data: doctor, message: 'Doctor loaded successfully!' }, status: :ok
    else
      render json: doctor.errors, status: :bad_request
    end
  end

  def create
    doctor = Doctor.new(doctor_params)

    if doctor.save
      render json: { status: 'SUCCESS', data: doctor, message: 'Doctor created successfully!' }, status: :created
    else
      render json: doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    doctor = Doctor.find(params[:id])
    if doctor.destroy!
      render json: { message: 'Doctor deleted successfully', data: doctor.id }, status: :ok
    else
      render json: doctor.errors, status: :bad_request
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :fee, :image, :details)
  end
end
