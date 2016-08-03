class ToyRobotSim::Robot

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

  def turn_left
    case @direction
    when 'NORTH'
      @direction = 'WEST'
    when 'SOUTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'NORTH'
    when 'WEST'
      @direction = 'SOUTH'
    end
  end

  def turn_right
    case @direction
    when 'NORTH'
      @direction = 'EAST'
    when 'SOUTH'
      @direction = 'WEST'
    when 'EAST'
      @direction = 'SOUTH'
    when 'WEST'
      @direction = 'NORTH'
    end
  end

  def report
    "#{@x}, #{@y}, #{@direction}"
  end

end
