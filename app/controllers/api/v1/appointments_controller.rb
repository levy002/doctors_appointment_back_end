class Api::V1::AppointmentsController < ApplicationController
  def index
    appointments = Appointment.where(user_id: current_user.id)
    if appointments
      render json: { data: appointments, message: 'Appointment loaded successfully!!' }, status: :ok
    else
      render json: { error: 'No Appointments available!' }, status: :not_found
    end
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user_id = current_user.id
    if appointment.save
      render json: { data: appointment, message: 'Appointment created successfully!' }, status: :created
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    if appointment.destroy!
      render json: { message: 'Appointment deleted successfully!' }, status: :ok
    else
      render json: { message: 'Failed to delete this appointment!' }, status: :bad_request
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:city, :appointment_time, :user_id, :doctor_id)
  end
end
