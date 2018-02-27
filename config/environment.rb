# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:only_hour] = "%H:%M"
Time::DATE_FORMATS[:date_and_time] = "%Y/%m/%d - %H:%M"
