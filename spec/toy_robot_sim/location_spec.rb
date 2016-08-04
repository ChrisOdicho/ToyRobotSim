require 'spec_helper'

describe ToyRobotSim::Location do
  let(:location) { ToyRobotSim::Location.new(0,1) }

  it 'has has a X attribute' do
    expect(location.x).to eq 0
  end

  it 'has has a Y attribute' do
    expect(location.y).to eq 1
  end
end
