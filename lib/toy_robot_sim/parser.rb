module ToyRobotSim::Parser

  def self.parse(file_path)
    if !File.file?(file_path)
      puts "Error: File not found (#{file_path})"
    elsif File.extname(file_path) != ".txt"
      puts "Error: File not .txt (#{file_path})"
    else

      file = File.open(file_path)
      puts "Parsing #{file.path}..."
      table = ToyRobotSim::Table.new(5,5)
      robot = ToyRobotSim::Robot.new(table)

      file.each do |instruction|
        execute(robot,instruction)
      end
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
      puts "Error: Robot does not know what to do with instruction '#{instruction.chomp}'"
    end
  end

  #############################################################################

  private

  def self.place(robot, instruction)
    if instruction =~ /PLACE [0-9]{1},[0-9]{1},(NORTH|EAST|SOUTH|WEST)/
      *xyf      = instruction[6..-1].split(',')
      location  = ToyRobotSim::Location.new(xyf[0], xyf[1])
      direction = xyf[2].chomp

      robot.place(location, direction)
    end
  end

end