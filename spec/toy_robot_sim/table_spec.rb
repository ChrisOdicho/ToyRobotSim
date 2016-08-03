require 'spec_helper'

describe ToyRobotSim::Table do
  let(:table) { ToyRobotSim::Table.new(5,5) }

  it 'has a width and height' do
    expect(table.width).to eq(5)
    expect(table.height).to eq(5)
  end

  it 'prevents objects from being outside the width and height' do
    expect(table.width_in_range?(10)).to be false
    expect(table.height_in_range?(10)).to be false

    expect(table.width_in_range?(5)).to be false
    expect(table.height_in_range?(5)).to be false
  end
end
