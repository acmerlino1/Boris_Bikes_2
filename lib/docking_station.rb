require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "No space available" if full?
    @bikes << bike 
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end 
