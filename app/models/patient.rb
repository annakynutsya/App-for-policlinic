class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # attr_accessor :avatar
  attr_accessor :admin
  
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :phone, presence: true, uniqueness: { message: "must be unique" }, numericality: { only_integer: true }, length: { minimum: 10 }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for rails >= 5.1
  def will_save_change_to_email?
    false
  end
end
