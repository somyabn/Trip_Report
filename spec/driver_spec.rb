require 'spec_helper'

describe Driver do

  before :each do
    @driver = Driver.new("Cool Driver")
    @trip1 = Trip.new("Cool Driver","1:40","2:40","40")
    @trip2 = Trip.new("Cool Driver","2:40","3:40","40")
    @trip = [@trip1, @trip2]
  end

  describe "#new" do
    it "it returns a Driver object" do
      expect(@driver).to be_an_instance_of(Driver)
    end
  end

  describe "#name" do
    it "returns the correct name" do
      expect(@driver.name).to eq("Cool Driver")
    end
  end




end