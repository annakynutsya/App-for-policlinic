# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # def authenticate_admin_user!
  #   authenticate_user! # Your authentication method, e.g., Devise's authenticate_user!
  #   redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_patient.admin? || current_doctor.admin?
  # end
end
