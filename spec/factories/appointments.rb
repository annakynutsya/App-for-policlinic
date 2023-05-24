FactoryBot.define do
  factory :appointment do
    # Define the attributes for the appointment factory
    # For example:
    appointment_datetime { Time.zone.now }
    recommendation { "" }
    status { "open" }

    # Define the associations
    association :doctor
    association :patient
  end
end
