require 'spec_helper'

describe DriverTripParser do

  before :each do
    @file = DriverTripParser.new('input.txt')
  end

  describe "#new" do
    it "it returns a Driver object" do
      expect(@file).to be_an_instance_of(DriverTripParser)
    end
  end

  describe "#drivers" do
    it "accepts the input file from argument and returns all drivers in file" do
      expect(@file.drivers.count).to eq(5)
    end
  end

  describe "#trips" do
    it "accepts the input file from argument and returns all trips in file" do
      expect(@file.trips.count).to eq(11)
    end
  end


end