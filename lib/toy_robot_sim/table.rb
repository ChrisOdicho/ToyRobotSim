class ToyRobotSim::Table

  def initialize(width, height)
    @width = width
    @height = height
  end

  #############################################################################

  def width
    @width ||= self.width
  end

  def height
    @height ||= self.height
  end

  #############################################################################

  def width_in_range?(x)
    x >= 0 && x <= (width - 1)
  end

  def height_in_range?(y)
    y >= 0 && y <= (height - 1)
  end

end
