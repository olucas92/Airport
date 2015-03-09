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

  def weather_status
    #bring back either sunny or stormy weather condition
    @weather_condition = ['sunny', 'stormy'].shuffle.first

    if @weather_condition == 'sunny'
      sunny_weather_condition = @weather_condition
    end

    if @weather_condition == 'stormy'
      stormy_weather_condition = @weather_condition
    end
  end

end