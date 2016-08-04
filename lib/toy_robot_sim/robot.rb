class ToyRobotSim::Robot

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  #############################################################################

  def initialize(table)
    @table = table
  end

  #############################################################################

  def table
    @table ||= self.table
  end

  def x
    @x ||= self.x
  end

  def y
    @y ||= self.y
  end

  def direction
    @direction ||= self.direction
  end

  #############################################################################

  def place(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
    case @direction
    when 'NORTH'
      @x +=1
    when 'SOUTH'
      @x -=1
    when 'EAST'
      @y +=1
    when 'WEST'
      @y -=1
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
    "#{@x},#{@y},#{@direction}"
  end

end
