require 'rails_helper'

RSpec.feature 'Doctor adds recommendation for appointment', type: :feature do
  let!(:doctor) { create(:doctor) }
  let!(:patient) { create(:patient) }
  let!(:appointment) { create(:appointment, doctor: doctor, patient: patient, recommendation: nil) }

  scenario 'Doctor logs in and adds a recommendation for an appointment' do
    visit '/doctors/sign_in'
    fill_in 'Phone', with: '1234567890'
    fill_in 'Password', with: '123456'
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'

    visit doctor_path(doctor)
    expect(page).to have_content "Hello, #{doctor.first_name} #{doctor.last_name}, here are your appointments!"

    click_link 'Create Recommendation'
    expect(page).to have_content 'New Recommendation'

    fill_in 'appointment[recommendation]', with: 'Please follow up with the patient in two weeks.'
    click_button 'Create Recommendation'

    expect(page).to have_content 'Recommendation created successfully.'
    expect(page).to have_content 'Please follow up with the patient in two weeks.'
  end
end
