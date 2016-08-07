require 'spec_helper'

describe ToyRobotSim::Cli::Application do
  let(:cli) { ToyRobotSim::Cli::Application }

  it 'can parse a directory of .txt files' do
    args   = %w(start -d docs)
    regexp = /^Parsing directory docs.../

    expect{cli.start(args)}.to output(regexp).to_stdout
  end

  it 'can parse a single .txt file' do
    args   = %w(start -f docs/samples/instructions.txt)
    regexp = /^Parsing docs\/samples\/instructions.txt.../

    expect{cli.start(args)}.to output(regexp).to_stdout
  end
end