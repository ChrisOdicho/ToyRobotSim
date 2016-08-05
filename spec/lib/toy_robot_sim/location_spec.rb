require 'spec_helper'

describe ToyRobotSim::Location do

  context 'valid params' do
    let(:location) { ToyRobotSim::Location.new(0,1) }

    it 'has a X attribute' do
      expect(location.x).to eq 0
    end

    it 'has a Y attribute' do
      expect(location.y).to eq 1
    end
  end

  context 'invalid params' do
    let(:location) { ToyRobotSim::Location.new("invalid", String) }

    it 'defaults X to zero' do
      expect(location.x).to eq 0
    end

    it 'defaults Y to zero' do
      expect(location.y).to eq 0
    end
  end
end
