# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    elsif user.doctor?
      can :read, Patient
      can :manage, Appointment, doctor_id: user.id
    elsif user.patient?
      can :read, Doctor
      can :create, Appointment
      can :manage, Appointment, patient_id: user.id
    else
      can :read, DoctorCategory
    end
  end
end
