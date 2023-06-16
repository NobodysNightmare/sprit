# frozen_string_literal: true

gasoline = Fuel.find_or_create_by!(name: 'Benzin', unit: 'L')
electricity = Fuel.find_or_create_by!(name: 'Strom', unit: 'kWh')
fuels = [gasoline, electricity]

car = Car.find_or_create_by!(name: 'Test Car') do |c|
  c.start_date = 1.year.ago
  c.start_distance = 4
  c.start_price = 25_000
end

if CarLog.count.zero?
  odometer = car.start_distance
  12.times do |i|
    time = (12 - i).months.ago
    distance = rand(100..2000)
    odometer += distance
    car_log = car.logs.create!(time: time, odometer:, distance:)
    fuels.each do |f|
      car_log.refuels.create!(fuel: f, units_used: rand(5.0..100.0), cost: rand(5.0..100.0))
    end
  end
end
