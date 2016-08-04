require 'spec_helper'

describe ToyRobotSim::Robot do
  let(:table)    { ToyRobotSim::Table.new(5,5) }
  let(:location) { ToyRobotSim::Location.new(0,1) }
  let(:robot)    { ToyRobotSim::Robot.new(table) }

  before do
    # Robot is placed at 0,1, NORTH before each test

    robot.place(location,'NORTH')
  end

  it 'can be placed on a table' do
    expect(robot.table).to eq table
  end

  it 'has a location' do
    expect(robot.location.x).to eq 0
    expect(robot.location.y).to eq 1
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

    expect(robot.location.y).to eq 2
  end

  it 'can turn left' do
    robot.left

    expect(robot.direction).to eq 'WEST'
  end

  it 'can turn right' do
    robot.right

    expect(robot.direction).to eq 'EAST'
  end

  it 'can report it\'s current position on the table' do
    expect(robot.report).to eq '0,1,NORTH'
  end

  it 'cannot be placed outside the table'

end
