class Api::V1::AppointmentsController < ApplicationController
  before_action :authorized, only: %i[create update destroy]

  def index
    @appointment = Appointment.all
    if @appointments
      render json: @appointment
    else
      render json: { error: 'Appointment not found' }, status: :not_found
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    user = User.find(@appointment[:user_id])
    doctor = Doctor.find(@appointment[:doctor_id])
    appoint = { appointment: @appointment, doctor:, created_by: user }
    render json: appoint
  end

  def getAppointment
    @appointment = Appointment.where(Appointment_params)
    render json: @appointment
  end

  def create
    appoint = params.require(:appointment)
      .permit(:phone, :doctor_id)
      .merge(user: @user)
    appointment = Appointment.find_by(doctor_id: params[:doctor_id], user_id: @user.id)
    if appointment
      render json: { appointment:,
                     message: 'Appointment Exist before with the same doctor_id and user' },
             status: :created
    elsif Doctor.find(params[:doctor_id])
      @appointment = Appointment.create(appoint)
      if @appointment.save
        render json: { appointment: @appointment, message: 'Appointment created successfully!' }, status: :created
      else
        render json: { error: @appointment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'No doctor registerd with this id' }, status: :not_found
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if Doctor.find(params[:doctor_id])
      if @user[:id] == @appointment[:user_id]
        update_Appointment = Appointment_params.merge(user: @user)
        if @appointment.update(update_Appointment)
          render json: { appointment: @appointment, message: 'Appointment updated successfully!' }
        else
          render json: { errors: @appointment.errors.full_messages, message: 'Appointment not updated!' }
        end
      else
        render json: { message: 'Only the owner of this appointment is permitted to update it!' }
      end
    else
      render json: { error: 'No doctor registerd with this id' }, status: :not_found
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @user[:id] == @appointment[:user_id]
      if @appointment.destroy
        render json: { appointment: @appointment, message: 'Appointment deleted successfully!' }, status: :ok
      else
        render json: { errors: @appointment.errors.full_messages,
                       message: 'Appointment not deleted!' },
               status: :unauthorized_user
      end
    else
      render json: { message: 'Only the owner is permitted to delete this appointment!' }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:phone, :doctor_id, :user_id)
  end
end
