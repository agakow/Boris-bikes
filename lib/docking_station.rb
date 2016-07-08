require_relative 'bike'
require_relative 'van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :bikes
  #attr_reader :brokenbikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'All bikes are broken' unless bikes.last.working?
    bike = bikes.select{|bike| bike.working?}.pop
    bikes.delete(bike)
  end

  def dock(bike)
    fail 'No spaces to dock bike' if full?
    bikes << bike
    bike
  end

  #def broken_bikes
  #  brokenbikes = bikes.select {|bike| bike.working? == false }
  #  brokenbikes.takes_broken_bikes
#  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
