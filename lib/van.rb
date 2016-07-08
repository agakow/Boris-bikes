require_relative 'docking_station'

class Van
attr_reader :brokenbikes
attr_reader :fixed_bikes

def initialize
  @brokenbikes = []
  @fixed_bikes = []
end

def takes_broken_bikes(station)
    @brokenbikes = station.bikes.select {|bike| bike.working? == false }
    station.bikes.delete_if {|bike| brokenbikes.include?(bike) }
    @brokenbikes
end

def drops_off_broken_bikes(garage)
  @brokenbikes.each {|bike| garage.bikes_at_garage << bike}
  empty_van
end

def empty_van
  @brokenbikes = []
  @fixed_bikes = []
end

def accepts_fixed_bikes(garage)
  @fixed_bikes = garage.bikes_at_garage.select {|bike| bike.working? == true}
  garage.bikes_at_garage.delete_if {|bike| fixed_bikes.include?(bike) }
  @fixed_bikes
end

def drops_off_fixed_bikes(station)
  @fixed_bikes.each {|bike| station.bikes << bike}
  empty_van
end

end
