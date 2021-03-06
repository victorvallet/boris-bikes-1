require_relative 'bike'


class DockingStation


DEFAULT_CAPACITY = 20


  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
  	@capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    raise 'This bike is broken' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end


  private
  def full?
  	@bikes.count >= @capacity
  end

  private
  def empty?
  	@bikes.empty?
  end

end
