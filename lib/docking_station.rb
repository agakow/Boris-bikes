require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'All bikes are broken' if bikes.count == bikes.count {|bike| bike.working? == false}
    bike = bikes.select{|bike| bike.working?}.pop
    bikes.delete(bike)
  end

  def dock(bike)
    fail 'No spaces to dock bike' if full?
    bikes << bike
    bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
