module ToyRobotSim::Parser

  def self.parse(file)
    if (File.file?(file) && File.extname(file) == ".txt")
      puts "Parsing #{file}..."
      table = ToyRobotSim::Table.new(5,5)
      robot = ToyRobotSim::Robot.new(table)
      File.open(file).each do |instruction|
        execute(robot,instruction)
      end
      return true
    else
      return false
    end
  end

  def self.execute(robot, instruction)
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
      puts "Robot does not know what to do with instruction '#{instruction.chomp}'"
    end
  end

  def self.place(robot, instruction)
    *xyf      = instruction[6..-1].split(',')
    location  = ToyRobotSim::Location.new(xyf[0], xyf[1])
    direction = xyf[2].chomp

    robot.place(location, direction)
  end

end