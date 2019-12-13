require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if @bikes.empty?
      raise "No bikes available" 
    else
      @bikes.each {|bike| return bike if !bike.broken?}
      raise "No working bikes available"
    end
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
