class ToyRobotSim::Robot

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  attr_reader :table, :location, :direction

  #############################################################################

  def initialize(table)
    @table = table if table.is_a?(ToyRobotSim::Table)
  end

  #############################################################################

  def place(location, direction)
    if valid_move?(location, direction)
      @location  = location
      @direction = direction
    end
  end

  def move
    if placed?
      new_location = @location.send(@direction.downcase)
      @location    = new_location if valid_move?(new_location, @direction)
    end
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def report
    "#{@location.x},#{@location.y},#{@direction}" if placed?
  end

  #############################################################################

  private

  def turn(left_or_right)
    if placed?
      current_index = DIRECTIONS.index(@direction)
      @direction    = DIRECTIONS.rotate(left_or_right)[current_index]
    end
  end

  def valid_move?(location, direction)
    table.is_a?(ToyRobotSim::Table) &&
    table.in_range?(location) &&
    DIRECTIONS.include?(direction)
  end

  def placed?
    (@location.nil? || @direction.nil?) ? false : true
  end

end
