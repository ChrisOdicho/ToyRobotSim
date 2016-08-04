class ToyRobotSim::Table

  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  #############################################################################

  def in_range?(location)
    width_in_range?(location.x) && height_in_range?(location.y)
  end

  #############################################################################

  private

  def width_in_range?(x)
    x >= 0 && x <= (width - 1)
  end

  def height_in_range?(y)
    y >= 0 && y <= (height - 1)
  end

end
