class ToyRobotSim::Parser

  def execute(robot, instruction)
    if instruction.start_with?('PLACE')
      place(robot, instruction)
    elsif instruction.start_with?('MOVE')
      robot.move
    elsif instruction.start_with?('LEFT')
      robot.left
    elsif instruction.start_with?('RIGHT')
      robot.right
    elsif instruction.start_with?('REPORT')
      puts robot.report
    else
      puts "Robot does not know what to do with '#{instruction}'"
    end
  end

  def place(robot, instruction)
    *xyf      = instruction[6..-1].split(',')
    location  = ToyRobotSim::Location.new(xyf[0].to_i, xyf[1].to_i)
    direction = xyf[2].chomp

    robot.place(location, direction)
  end

end