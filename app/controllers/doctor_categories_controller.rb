class DoctorCategoriesController < ApplicationController
  def index
    @doctor_categories = DoctorCategory.all
  end

  def show
    @doctor_category = DoctorCategory.find(params[:id])
  end
end
