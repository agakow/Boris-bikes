require_relative 'docking_station'

class Van
attr_reader :brokenbikes

def initialize
  @brokenbikes = []
end

def takes_broken_bikes(station)
    @brokenbikes << station.bikes.select {|bike| bike.working? == false }
    station.bikes.delete_if {|bike| brokenbikes.include?(bike) }
end

end
