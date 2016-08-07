require 'spec_helper'

describe ToyRobotSim::Parser do
  let(:table)    { ToyRobotSim::Table.new(5,5) }
  let(:robot)    { ToyRobotSim::Robot.new(table)}
  let(:location) { ToyRobotSim::Location.new(0, 0) }
  let(:parser)   { ToyRobotSim::Parser }

  context 'valid commands' do
    it 'parses a file' do
      content      = "PLACE 0,0,NORTH\nREPORT"
      instructions = File.new('instructions.txt', 'w+')

      File.open('instructions.txt', 'w+') { |f| f.write(content) }
      expect{parser.parse(instructions)}.to output("Parsing instructions.txt...\n0,0,NORTH\n").to_stdout
      File.delete('instructions.txt')
    end

    it 'executes the command for PLACE 0,0,NORTH' do
      parser.execute(robot, 'PLACE 0,0,NORTH')

      expect(robot.location.x).to eq 0
      expect(robot.location.y).to eq 0
      expect(robot.direction).to eq 'NORTH'
    end

    it 'executes the command for MOVE' do
      robot.place(location, 'NORTH')
      parser.execute(robot, 'MOVE')

      expect(robot.location.y).to eq 1
    end

    it 'executes the command for LEFT' do
      robot.place(location, 'NORTH')
      parser.execute(robot, 'LEFT')

      expect(robot.direction).to eq 'WEST'
    end

    it 'executes the command for RIGHT' do
      robot.place(location, 'NORTH')
      parser.execute(robot, 'RIGHT')

      expect(robot.direction).to eq 'EAST'
    end

    it 'executes the command for REPORT' do
      robot.place(location, 'NORTH')

      expect{parser.execute(robot, 'REPORT')}.to output("0,0,NORTH\n").to_stdout
    end
  end

  context 'invalid commands' do
    it 'outputs an error for missing files' do
      expect{parser.parse('missing_instructions.txt')}.to output("Error: File not found (missing_instructions.txt)\n").to_stdout
    end

    it 'outputs an error for non .txt files' do
      expect{parser.parse('README.md')}.to output("Error: File not .txt (README.md)\n").to_stdout
    end

    it 'outputs an error for non existant commands' do
      expect{parser.execute(robot, 'JUMP')}.to output("Error: Robot does not know what to do with instruction 'JUMP'\n").to_stdout
    end
  end
end
