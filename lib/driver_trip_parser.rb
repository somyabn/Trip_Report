class DriverTripParser

  attr_accessor :drivers
  attr_accessor :trips

  def initialize input_file_name
    File.open(input_file_name, 'r') do |input_file|
      @drivers = Array.new
      @trips = Array.new
      input_file.readlines.each do |line|
        line = line.split
        case line[0]
          when 'Driver'
            driver = Driver.new(line[1])
            @drivers.push driver
            trip = Trip.new(driver.name,"00:00","00:00","0")
            @trips.push trip
          when 'Trip'
            trip = Trip.new(line[1],line[2],line[3],line[4])
            @trips.push trip
        end
      end

    end
  end
end