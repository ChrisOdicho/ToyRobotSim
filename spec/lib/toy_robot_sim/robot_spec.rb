require 'spec_helper'

describe ToyRobotSim::Robot do
  let(:table)    { ToyRobotSim::Table.new(5,5) }
  let(:robot)    { ToyRobotSim::Robot.new(table) }
  let(:location) { ToyRobotSim::Location.new(0,0) }

  context 'valid commands' do

    before do
      # Robot is placed at 0,0, NORTH before each test
      robot.place(location,'NORTH')
    end

    it 'can be placed on a table' do
      expect(robot.table).to eq table
    end

    it 'has a location' do
      expect(robot.location.x).to eq 0
      expect(robot.location.y).to eq 0
    end

    it 'has a facing direction' do
      expect(robot.direction).to eq 'NORTH'

      3.times do |i|
        robot.right
        expect(robot.direction).to eq ToyRobotSim::Robot::DIRECTIONS[i + 1]
      end
    end

    it 'can move forward in the direction it is facing' do
      robot.move

      expect(robot.location.y).to eq 1
    end

    it 'can turn left' do
      robot.left

      expect(robot.direction).to eq 'WEST'
    end

    it 'can turn right' do
      robot.right

      expect(robot.direction).to eq 'EAST'
    end

    it 'can report the current position on the table' do
      expect(robot.report).to eq '0,0,NORTH'
    end

  end

  context 'invalid commands' do

    it 'ignores commands if not placed on a table' do
      invalid_robot = ToyRobotSim::Robot.new("invalid table")
      invalid_robot.place(location, 'NORTH')
      invalid_robot.move

      expect(invalid_robot.table).to eq nil
      expect(invalid_robot.location).to eq nil
      expect(invalid_robot.direction).to eq nil
    end

    it 'cannot be placed outside the table' do
      invalid_location = ToyRobotSim::Location.new(10,10)
      robot.place(invalid_location, 'NORTH')

      expect(robot.location).to eq nil
    end

    it 'can only face NORTH, EAST, SOUTH, WEST' do
      robot.place(location, 'invalid direction')

      expect(robot.location).to eq nil
    end

    it 'cannot fall off the table during movement' do
      robot.place(location, 'WEST')
      robot.move

      expect(robot.location.x).to eq 0
      expect(robot.location.y).to eq 0
    end

    it 'ignores instructions if not placed' do
      expect(robot.move).to eq nil
      expect(robot.right).to eq nil
      expect(robot.left).to eq nil
      expect(robot.report).to eq nil
    end
  end

end
