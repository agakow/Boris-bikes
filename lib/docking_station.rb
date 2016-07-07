require_relative 'bike'

class DockingStation
      DEFAULT_CAPACITY = 20
  attr_reader :bikes
  #:DEFAULT_CAPACITY

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
    @bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
