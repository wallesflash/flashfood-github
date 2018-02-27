class Booking < ApplicationRecord
  belongs_to :customer
  
  scope :sort_by_date, lambda{order("booking_data ASC")}

  def short_time_start
    # self[:booking_hour_start].to_s(:only_hour)
    @short_time_start = Booking.select(:booking_hour_start).find_by_id(id)

  end

  def selected
    @start_selected = self.find(:all)
  end

  def short_time_end
    # self[:booking_hour_end].to_s(:only_hour)
    self[:booking_hour_end].strftime('%H:%M')
  end
  # def test
  #   @test = BookingHour.all(:select => 'booking_hour_start').map(&:booking_hour_start)
  # end

end
