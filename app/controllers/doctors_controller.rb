class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    authorize! :read, Doctor
  end
end
