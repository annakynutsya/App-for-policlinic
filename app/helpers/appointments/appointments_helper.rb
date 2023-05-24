module Appointments::AppointmentsHelper
  def time_options(doctor_id)
    start_time = Time.zone.parse("09:00")
    end_time = Time.zone.parse("17:00")
    interval_minutes = 15

    time_range = (start_time.to_i..end_time.to_i).step(interval_minutes.minutes)
    available_times = time_range.map { |t| Time.zone.at(t) }

    existing_appointments = Appointment.where(doctor_id: doctor_id)
    booked_datetimes = existing_appointments.pluck(:appointment_datetime)

    today = Time.zone.today
    next_two_weeks = (today..today + 13.days)

    available_datetimes = next_two_weeks.flat_map do |date|
      available_times.map { |time| DateTime.new(date.year, date.month, date.day, time.hour, time.min) }
    end

    available_datetimes.reject { |datetime| booked_datetimes.include?(datetime) }
                       .map { |datetime| [datetime.strftime("%Y-%m-%d %H:%M"), datetime] }
  end
end
