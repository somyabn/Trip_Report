require 'spec_helper'

describe DriverTripStats do

  before :all do
    File.delete('output.txt') if File.exist?('output.txt')
    @driver = Driver.new("Cool_Driver")
    @trip1 = Trip.new("Cool Driver","1:40","2:40","40")
    @trip2 = Trip.new("Cool Driver","2:40","3:40","40")
    @trip = [@trip1, @trip2]
    @rg = DriverTripStats.new()
  end

  describe "#new" do
    it "it returns a report generator object" do
      expect(@rg).to be_an_instance_of(DriverTripStats)
    end
  end

  describe "#calculate_total_miles_driven" do
    it "accepts all trips of a driver and returns the total miles driven" do
      expect(@rg.calculate_total_miles_driven @trip).to eq(80.0)
    end
  end

  describe "#calculate_average_speed" do
    it "accepts all trips of a driver and returns the average speed" do
      total_miles_driven = @rg.calculate_total_miles_driven @trip
      expect(@rg.calculate_average_speed @trip,total_miles_driven).to eq(40.0)
    end
  end


end