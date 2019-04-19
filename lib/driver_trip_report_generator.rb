class DriverTripReportGenerator

  def sort_by_highest_miles_driven records
    records.sort_by! {|r| r.total_miles_driven}.reverse!
  end

  def generate_report report_records
    File.delete('output.txt') if File.exist?('output.txt')
    report_records.each do |record|
      unless (record.total_miles_driven == 0 or record.average_speed < 5 or record.average_speed > 100)
        puts "#{record.driver_name}: #{record.total_miles_driven} miles @#{record.average_speed} mph\n"
        File.open('output.txt', 'a') {|file| file.write("#{record.driver_name}: #{record.total_miles_driven} miles @#{record.average_speed} mph\n")}
      end
      if record.total_miles_driven == 0
       puts "#{record.driver_name}: #{record.total_miles_driven} miles \n"
        File.open('output.txt', 'a') {|file| file.write("#{record.driver_name}: #{record.total_miles_driven} miles \n")}
      end
    end
  end

end