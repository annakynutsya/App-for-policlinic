class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :doctor_category
  has_many :appointments
  has_many :patients, through: :appointments

  has_one_attached :avatar

  validates :doctor_category, presence: true
  validates :phone, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { minimum: 10 }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
