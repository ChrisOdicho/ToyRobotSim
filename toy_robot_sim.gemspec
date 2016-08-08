# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robot_sim/version'

Gem::Specification.new do |spec|
  spec.name          = "toy_robot_sim"
  spec.version       = ToyRobotSim::VERSION
  spec.authors       = ["Chris Odicho"]
  spec.email         = ["chris.odicho@gmail.com"]

  spec.summary       = "A Toy Robot Simulator written in Ruby 2.2.3"
  spec.homepage      = "https://github.com/ChrisOdicho/toy_robot_sim"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["robot"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", " ~> 3.4"
  spec.add_development_dependency "thor", "~> 0.18"
end
