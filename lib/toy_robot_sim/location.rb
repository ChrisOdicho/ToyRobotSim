class ToyRobotSim::Location

  attr_reader :x, :y

  def initialize(x, y)
    if x.respond_to?(:to_i) && y.respond_to?(:to_i)
      @x = x.to_i
      @y = y.to_i
    else
      @x = 0
      @y = 0
    end
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
