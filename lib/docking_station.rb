require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end


  private
  def full?
  	@bikes.count >= 20 ? true : false
  end

  private
  def empty?
  	@bikes.empty?
  end

end
