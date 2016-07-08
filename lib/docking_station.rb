require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_accessor :capacity
attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes availible' if empty?
    raise 'Bike is broken' if bikes.last.broken?
    bikes.pop
  end

  def dock bike
    raise 'The dock is full' if full?
    bikes << bike
  end

  private

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
