ActiveAdmin.register Appointment do
  permit_params :doctor_id, :patient_id, :appointment_datetime, :appointment_time, :status, :recommendation
  form do |f|
    f.inputs do
      f.input :doctor_id, as: :select, collection: Doctor.all.map { |c| ["#{c.first_name} #{c.last_name}", c.id] }
      f.input :patient_id, as: :select, collection: Patient.all.map { |c| ["#{c.first_name} #{c.last_name}", c.id] }
      f.input :appointment_datetime
      f.input :recommendation
      f.input :status
    end
    f.actions
  end
end
