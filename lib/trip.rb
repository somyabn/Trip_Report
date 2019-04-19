class Trip

  attr_accessor :driver_name, :start_time, :stop_time, :miles_driven

  def initialize(driver_name,start_time,stop_time,miles_driven)
    @driver_name = driver_name
    @start_time = Time.parse(start_time)
    @stop_time = Time.parse(stop_time)
    @miles_driven = miles_driven.to_f
  end

  def trip_duration
    (@stop_time - @start_time).to_f
  end
end