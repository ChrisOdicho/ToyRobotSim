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

  def north
    ToyRobotSim::Location.new(x, y + 1)
  end

  def east
    ToyRobotSim::Location.new(x + 1, y)
  end

  def south
    ToyRobotSim::Location.new(x, y - 1)
  end

  def west
    ToyRobotSim::Location.new(x - 1, y)
  end

end
