class ProfilesController < ApplicationController
  before_action :authenticate_doctor!
  load_and_authorize_resource :doctor

  def show
    # Fetch the doctor's appointments, if needed
    @appointments = @doctor.appointments
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name)
  end
end
