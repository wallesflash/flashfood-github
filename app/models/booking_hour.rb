class BookingHour < ApplicationRecord
  # belongs_to :booking

  def short_hour_start
    # self[:booking_hour_start].to_s(:only_hour)
    self[:start].strftime('%H:%M')
  end

  def short_hour_end
    # self[:booking_hour_end].to_s(:only_hour)
    self[:end].strftime('%H:%M')
  end
end
