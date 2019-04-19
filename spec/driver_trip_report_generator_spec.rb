require 'spec_helper'

describe DriverTripReportGenerator do

  before :all do
    File.delete('output.txt') if File.exist?('output.txt')
    driver1_trip_stats = DriverTripStats.new
    driver1_trip_stats.driver_name = "Driver_one"
    driver1_trip_stats.total_miles_driven = 46
    driver1_trip_stats.average_speed = 100
    driver2_trip_stats = DriverTripStats.new
    driver2_trip_stats.driver_name = "Driver_two"
    driver2_trip_stats.total_miles_driven = 50
    driver2_trip_stats.average_speed = 4
    driver3_trip_stats = DriverTripStats.new
    driver3_trip_stats.driver_name = "Driver_three"
    driver3_trip_stats.total_miles_driven = 35
    driver3_trip_stats.average_speed = 101
    @records = [driver1_trip_stats, driver2_trip_stats, driver3_trip_stats]
    @rg = DriverTripReportGenerator.new()
    @sorted_records = @rg.sort_by_highest_miles_driven @records
    @rg.generate_report @sorted_records

  end

  describe "#sort_report" do
    it "sort the report by highest miles driven" do
      first_record = @sorted_records.first
      expect(@sorted_records.first.total_miles_driven).to eq(50)
    end
  end

  describe "#generate_report" do

    it "creates the report file with Driver Trip Stats" do
      File.open('output.txt', 'r') do |output_file|
        record = output_file.readlines
        expect(record.count).to eq(1)
        first_record = record.first.split
        expect(first_record[0]).to eq("Driver_one:")
        expect(first_record[1]).to eq("46")
        expect(first_record[2]).to eq("miles")
        expect(first_record[3]).to eq("@100")
        expect(first_record[4]).to eq("mph")
      end

    end
  end


  it "trip with average speed less than 5 mph is not on report" do
    File.open('output.txt', 'r') do |output_file|
      record = output_file.readlines
      expect(record.count).to eq(1)

    end
  end

  it "trip with average speed less than 5 mph is not on report" do
    File.open('output.txt', 'r') do |output_file|
      record = output_file.readlines
      expect(record.count).to eq(1)

    end
  end

  it "trip with average speed greater than 100 mph is not on report" do
    File.open('output.txt', 'r') do |output_file|
      record = output_file.readlines
      expect(record.count).to eq(1)

    end
  end
end
