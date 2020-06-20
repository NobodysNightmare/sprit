namespace :car_logs do
  desc 'Recalculates distances based on own odometer and odometer of previous ' \
       'odometer in timeline.'
  task :recalculate_distances do
    Car.all.each do |car|
      odo = car.start_distance
      car.logs.order(:time).each do |log|
        distance = log.odometer - odo
        if distance.negative?
          puts "#{car.name} moved backwards at #{log.time} (Odometer changed from #{odo} km to #{log.odometer} km)"
        end

        if(distance != log.distance)
          puts "#{car.name} changing distance from #{log.distance} km to #{distance} km at #{log.odometer} km"
          log.update!(distance: distance)
        end

        odo = log.odometer
      end
    end
  end
end
