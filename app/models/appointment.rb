class Appointment < ApplicationRecord
  enum status: { open: 'open', closed: 'closed' }

  belongs_to :doctor
  belongs_to :patient
  # belongs_to :time_slot

  accepts_nested_attributes_for :patient

  before_save :check_recommendation_and_update_status

  validate :validate_open_appointments_limit, on: :create
  validates_presence_of :patient

  validates :appointment_datetime, uniqueness: { scope: :doctor_id, message: "Appointment date and time are not available for the selected doctor." }

  private

  def check_recommendation_and_update_status
    self.status = 'closed' if recommendation.present?
  end

  def validate_open_appointments_limit
    return unless doctor_id.present?

    open_appointments_count = Appointment.where(doctor_id: doctor_id, status: 'open').count
    if open_appointments_count >= 5
      errors.add(:base, 'Maximum open appointments reached for this doctor')
      throw :abort
    end
  end
end
