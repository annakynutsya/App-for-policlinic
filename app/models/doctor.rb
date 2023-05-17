class Doctor < ApplicationRecord
  belongs_to :doctor_category
  has_many :appointments
  has_many :patients, through: :appointments

  validates :doctor_category, presence: true
end
