require_relative './lib//driver'
require_relative './lib/driver_trip_parser'
require_relative './lib/driver_trip_stats'
require_relative './lib/driver_trip_report_generator'
require_relative './lib/trip'
input_file_name = ARGV[0]
report_records = Array.new
records = DriverTripParser.new(input_file_name)
drivers = records.drivers
trips = records.trips
overall_trips = drivers.collect {|driver| records.trips.find_all {|trip| trip.driver_name == driver.name}}
overall_trips.each do |ot|
  rg = DriverTripStats.new
  rg.send_info_to_report ot
  report_records.push rg
end
report_generator = DriverTripReportGenerator.new()
sorted_report_records = report_generator.sort_by_highest_miles_driven report_records
report_generator.generate_report report_records


