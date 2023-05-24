class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  
  def index
    @doctors= Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments
  end
end
