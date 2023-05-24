require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  describe 'POST #create' do
    let!(:doctor) { create(:doctor) }
    
    context 'with valid parameters' do
      let(:valid_params) do
        {
          appointment: {
            doctor_id: doctor.id,
            appointment_datetime: DateTime.now,
            recommendation: 'Some recommendation',
            status: 'open',
            patient_attributes: {
              first_name: 'John',
              last_name: 'Doe',
              phone: '1234567890',
              password: 'password',
              password_confirmation: 'password'
            }
          }
        }
      end

      it 'creates a new appointment' do
        expect {
          post '/appointments', params: valid_params
        }.to change(Appointment, :count).by(1)
      end

      it 'redirects to the appointment show page' do
        post '/appointments', params: valid_params
        appointment = Appointment.last
        expect(response).to redirect_to(appointment_path(appointment))
      end

      it 'sets a success notice' do
        post '/appointments', params: valid_params
        expect(flash[:notice]).to eq('Appointment created successfully.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          appointment: {
            doctor_id: doctor.id,
            appointment_datetime: DateTime.now,
            recommendation: nil,
            status: 'open',
            patient_attributes: {
              first_name: 'John',
              last_name: 'Doe',
              phone: '123',
              password: 'password',
              password_confirmation: 'word'
            }
          }
        }
      end

      it 'does not create a new appointment' do
        expect {
          post '/appointments', params: invalid_params
        }.not_to change(Appointment, :count)
      end

      it 'renders the new template' do
        post '/appointments', params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end
