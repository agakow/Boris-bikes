require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'No spaces to dock bike' if full?
    @bikes << bike
    bike
  end

  private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end

end
