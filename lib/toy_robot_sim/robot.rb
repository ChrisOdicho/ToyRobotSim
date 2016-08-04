class ToyRobotSim::Robot

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  attr_accessor :location

  #############################################################################

  def initialize(table)
    @table = table
  end

  #############################################################################

  def table
    @table ||= self.table
  end

  def direction
    @direction ||= self.direction
  end

  #############################################################################

  def place(location, direction)
    @location = location
    @direction = direction
  end

  def move
    case @direction
    when 'NORTH'
      @location = @location.north
    when 'EAST'
      @location = @location.east
    when 'SOUTH'
      @location = @location.south
    when 'WEST'
      @location = @location.west
    end
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def turn(left_or_right)
    current_index = DIRECTIONS.index(@direction)
    @direction    = DIRECTIONS.rotate(left_or_right)[current_index]
  end

  def report
    "#{@location.x},#{@location.y},#{@direction}"
  end

end
