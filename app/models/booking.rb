class Booking < ApplicationRecord
  has_many :tables
  scope :sort_by_date, lambda{order("booking_data ASC")}

end
