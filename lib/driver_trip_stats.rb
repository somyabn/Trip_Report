class DriverTripStats

  SECONDS_TO_HR = 1.0/3600
  attr_accessor :driver_name
  attr_accessor :total_miles_driven
  attr_accessor :average_speed

  def send_info_to_report driver_trips
    @driver_name = driver_trips.first.driver_name
    @total_miles_driven = calculate_total_miles_driven driver_trips
    @total_miles_driven = @total_miles_driven.round  unless @total_miles_driven.nil?
    @average_speed = calculate_average_speed driver_trips,@total_miles_driven
    @average_speed = @average_speed.round unless @average_speed.nil?
  end

  def calculate_total_miles_driven driver_trips
    driver_trips.collect{|trips| trips.miles_driven}.inject(0){|sum,x| sum + x }
  end

  def calculate_average_speed driver_trips ,total_miles_driven
    total_trip_time = driver_trips.select {|trip| trip.miles_driven != "0"}
    total_trip_time = total_trip_time.collect {|trip| trip.trip_duration}.inject{ |sum, el| sum + el }  unless total_miles_driven == 0
    (total_miles_driven) / (total_trip_time * SECONDS_TO_HR) unless total_miles_driven == 0
  end

end