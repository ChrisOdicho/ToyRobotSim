require 'spec_helper'

describe ToyRobotSim::Robot do
  let(:robot) { ToyRobotSim::Robot.new() }

  it 'can be placed on a table'
  it 'has a facing direction'
  it 'can move forward in the direction it is facing'
  it 'can turn left'
  it 'can turn right'
  it 'can report it\'s current position on the table'
end
