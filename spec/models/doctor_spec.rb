require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor_category) { create(:doctor_category) }
  subject { build(:doctor, doctor_category: doctor_category) }

  it 'is valid with a valid phone number' do
    expect(subject).to be_valid
  end

  it 'is invalid without a phone number' do
    subject.phone = nil
    expect(subject).to be_invalid
    expect(subject.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid with a phone number less than 10 digits' do
    subject.phone = '123456789'
    expect(subject).to be_invalid
    expect(subject.errors[:phone]).to include('is too short (minimum is 10 characters)')
  end

  it 'is invalid with a non-integer phone number' do
    subject.phone = '123abc4567'
    expect(subject).to be_invalid
    expect(subject.errors[:phone]).to include('is not a number')
  end

  it 'is invalid with a duplicate phone number' do
    existing_doctor = create(:doctor, phone: '1234567890', doctor_category: doctor_category)
    subject.phone = '1234567890'
    expect(subject).to be_invalid
    expect(subject.errors[:phone]).to include('has already been taken')
  end
end
