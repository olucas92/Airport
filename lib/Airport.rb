class Airport

  DEFAULT_CAPACITY = 10

  def initialize
    @planes ||= []
    @planes = []
  end

  def airport
    @airport
  end

  def dock(plane)
    raise "Airport is full" if full?
    @planes << plane
  end

  def full?
    plane_count == capacity
  end

  def release(plane)
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

end