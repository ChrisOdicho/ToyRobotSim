class ToyRobotSim::Location

  def initialize(x, y)
    @x = x
    @y = y
  end

  #############################################################################

  def x
    @x ||= self.y
  end

  def y
    @y ||= self.y
  end

  #############################################################################


end
