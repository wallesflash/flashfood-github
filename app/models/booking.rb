class Booking < ApplicationRecord
  belongs_to :customer


  scope :sort_by_date, lambda{order("booking_data ASC")}

  def short_time_start

    @short_time_start = Booking.select(:booking_hour_start).find_by_id(id)

  end

  def selected
    @start_selected = self.find(:all)
  end

  def short_time_end

    self[:booking_hour_end].strftime('%H:%M')
  end

  validates_presence_of :customer_name, :customer_surename, :phone_no, :table_id, :booking_data, :booking_hour_start, :booking_hour_end, message: "To pole jest wymagane"

end
