require 'spec_helper'

describe ToyRobotSim::Cli::Application do

  it 'can parse a directory of .txt files' do
    args   = %w(start -d docs)
    regexp = /^Parsing directory docs.../

    expect{ToyRobotSim::Cli::Application.start(args)}.to output(regexp).to_stdout
  end

  it 'can parse a single .txt file'
  it 'can interactively parse commands from user input'
end