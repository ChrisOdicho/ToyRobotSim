require 'spec_helper'

describe ToyRobotSim::Parser do
  let(:table)    { ToyRobotSim::Table.new(5,5) }
  let(:robot)    { ToyRobotSim::Robot.new(table)}
  let(:location) { ToyRobotSim::Location.new(0, 0) }
  let(:parser)   { ToyRobotSim::Parser }

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
