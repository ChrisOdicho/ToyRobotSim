require 'spec_helper'

describe ToyRobotSim::Table do
  let(:table) { ToyRobotSim::Table.new(5,5) }

  it 'has a width and height' do
    expect(table.width).to eq(5)
    expect(table.height).to eq(5)
  end

  it 'allows objects to be placed within the width and height' do
    location = ToyRobotSim::Location.new(0,0)

    expect(table.location_in_range?(location)).to be true
  end

  it 'prevents objects from being outside the width and height' do
    location = ToyRobotSim::Location.new(10,10)

    expect(table.location_in_range?(location)).to be false
  end
end
