class Plane

  def initialize!
    fly!
  end

  def flying?
    @flying
  end

  def fly!
    @flying = true
  end

  def land!
    @flying = false
  end

  # def take_off(plane)
  #  airport.release(plane)
  # end
end