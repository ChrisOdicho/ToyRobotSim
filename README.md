# ToyRobotSim

A Toy Robot Simulator developed and tested on OSX 10.11.4, Ruby 2.2.3

## Installation

Download source from Github

    $ git clone https://github.com/ChrisOdicho/toy_robot_sim.git
    $ cd toy_robot_sim
    $ bundle install

## Usage
To begin the toy robot simulation, navigate to the toy_robot_sim folder and run

    $ bin/robot start -option

Note: By default `robot start` will run with interactive mode
## Options

```
  d, [--directory=DIRECTORY]      # Choose a directory to parse
  f, [--file=FILE]                # Choose a file to parse
  i, [--interactive=INTERACTIVE]  # Input instructions via terminal (PLACE x,y,f | MOVE | LEFT | RIGHT | REPORT ) 
```

## Samples
To parse the default sample instructions (docs/samples) just run

    $ bin/robot start -d

## Tests
Run all the tests with

    $ rake spec

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

