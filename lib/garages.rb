

class Garage
attr_accessor :bikes_at_garage


  def initialize
    @bikes_at_garage = []
  end

  def fix_bikes
    @bikes_at_garage.each {|bike| bike.working = true}
  end

end
