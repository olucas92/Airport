require_relative 'weather.rb'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize
    @planes ||= []
    @planes = []
  end

  def airport
    @airport
  end

  def dock(plane)
    clear_for_landing
    plane.land!
    @planes << plane
  end

  def full?
    plane_count == capacity
  end

  def release(plane)
    raise "too stormy to take off" if stormy?
    @planes.delete(plane)
    plane.take_off
  end

  def plane_count
    @planes.count
  end

  def capacity=(value)
    @capacity = value
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def empty?
    plane_count == 0
  end

  def clear_for_landing
    raise "It's too stormy to land!" if stormy?
    raise "Sorry, the airport is full!" if full?
  end

end