namespace :legacy_import do
  desc 'Reads an old DB export from my former site, from foo.xml'
  task import: :environment do
    import = Hash.from_xml(File.read('foo.xml'))
    cars = import.dig('DriveLog', 'Cars', 'Car')
    fuel_entries = import.dig('DriveLog', 'FuelEntries', 'FuelLogEntry')
    service_entries = import.dig('DriveLog', 'ServiceEntries', 'ServiceLogEntry')

    cars.each do |car|
      Car.create!(id: car['Id'],
                  name: car['Name'],
                  start_distance: car['StartDistance'],
                  start_price: car['StartPrice'],
                  start_date: Date.parse(car['StartDate']))
    end

    fuel_entries.each do |entry|
      FuelLog.create!(car_id: entry['CarID'],
                      fuel_price: entry['FuelPrice'],
                      distance: entry['DistanceDriven'],
                      fuel_used: entry['FuelUsed'],
                      time: Time.parse(entry['Date']))
    end

    service_entries.each do |entry|
      ServiceLog.create!(car_id: entry['CarID'],
                      cost: entry['Cost'],
                      total_distance: entry['TotalDistance'],
                      description: entry['Description'],
                      time: Time.parse(entry['Date']))
    end
  end
end
