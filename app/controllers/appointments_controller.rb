class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy, :show]

  def new
    @appointment = Appointment.new
    @appointment.doctor_id = params[:doctor_id] if params[:doctor_id]

    @appointment.build_patient
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @doctors = Doctor.all
    @doctor = Doctor.find(@appointment.doctor_id)

    open_appointments_count = @doctor.appointments.where(status: 'open').count

    if @appointment.save
      if patient_signed_in?
        redirect_to patient_path(@appointment.patient), notice: 'Appointment created successfully.'
      else

        sign_in(@appointment.patient)
        redirect_to patient_path(@appointment.patient), notice: 'Appointment created successfully. You are now logged in.'
      end
    else
      render :new
    end
  end


  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_path(id: @appointment.doctor_id), notice: 'Recommendation created successfully.'
    else
      @doctors = Doctor.all
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment canceled successfully.'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointment_datetime, :recommendation, :status, :patient_id, patient_attributes: [:first_name, :last_name, :phone, :password, :password_confirmation])
  end
end
