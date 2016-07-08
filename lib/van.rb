require_relative 'docking_station'

class Van


def takes_broken_bikes(station)
    brokenbikes = station.bikes.select {|bike| bike.working? == false }
end

end
