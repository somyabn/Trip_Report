require 'spec_helper'

describe Trip do

  before :each do
    @trip = Trip.new("Cool Driver","1:40","2:40","90")
  end

  describe "#new" do
    it "it returns a Trip object" do
      expect(@trip).to be_an_instance_of(Trip)
    end
  end

  describe "#driver_name" do
    it "returns the correct driver name" do
      expect(@trip.driver_name).to eq("Cool Driver")
    end
  end

  describe "#driver_name" do
    it "returns the correct driver name" do
      expect(@trip.driver_name).to eq("Cool Driver")
    end
  end

  describe "#trip_start_time" do
    it "returns the correct trip start time" do
      expect(@trip.start_time).to eq(Time.parse("1:40"))
    end
  end

  describe "#trip_stop_time" do
    it "returns the correct trip stop time" do
      expect(@trip.stop_time).to eq(Time.parse("2:40"))
    end
  end

  describe "#trip_miles_driven" do
    it "returns the correct trip miles driven" do
      expect(@trip.miles_driven).to eq("90".to_f)
    end
  end

end