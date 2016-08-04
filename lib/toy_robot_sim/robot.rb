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
    if valid_move?(location, direction)
      @location = location
      @direction = direction
    end
  end

  def move
    new_location = @location.send(@direction.downcase)
    @location    = new_location if valid_move?(new_location, @direction)
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

  def valid_move?(location, direction)
    table.in_range?(location) && DIRECTIONS.include?(direction)
  end

end
