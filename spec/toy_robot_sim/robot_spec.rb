require 'spec_helper'

describe ToyRobotSim::Robot do
  let(:table) { ToyRobotSim::Table.new(5,5) }
  let(:robot) { ToyRobotSim::Robot.new(table) }

  before do
    robot.place(0,1,'NORTH')
  end

  it 'can be placed on a table' do
    expect(robot.table).to eq table
  end

  it 'has a location' do
    expect(robot.x).to eq 0
    expect(robot.y).to eq 1
  end

  it 'has a facing direction' do
    expect(robot.direction).to eq 'NORTH'
  end

  it 'can move forward in the direction it is facing' do
    robot.move

    expect(robot.x).to eq 1
  end

  it 'can turn left' do
    robot.turn_left

    expect(robot.direction).to eq 'WEST'
  end

  it 'can turn right' do
    robot.turn_right

    expect(robot.direction).to eq 'EAST'
  end

  it 'can report it\'s current position on the table' do
    expect(robot.report).to eq '0, 1, NORTH'
  end

end
