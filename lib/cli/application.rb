require 'thor'

module ToyRobotSim
  module Cli
    class Application < Thor

      desc 'start', 'Begin the toy robot simulation'

      method_option :directory,   desc: "Choose a directory to parse",
                                  lazy_default: "docs/samples",
                                  aliases: "d"

      method_option :file,        desc: "Choose a file to parse",
                                  lazy_default: "docs/samples/instructions.txt",
                                  aliases: "f"

      method_option :interactive, desc: "Input instructions via terminal (PLACE x,y,f | MOVE | LEFT | RIGHT | REPORT ) ",
                                  aliases: "i"

      #############################################################################

      def start
        if options[:directory]
          directory(options[:directory])
        elsif options[:file]
          file(options[:file])
        else
          interactive
        end
      end

      #############################################################################

      private

      def directory(path)
        working_directory = Dir.pwd

        if Dir.exists?(path)
          Dir.chdir(path)

          puts "Parsing directory #{path}..."
          puts "-"*80

          Dir.glob("*.txt") do |file|
            ToyRobotSim::Parser.parse(file)
            puts "-"*80
          end

          Dir.chdir(working_directory)
        else
          puts "Error: #{path} is an invalid directory"
        end
      end

      def file(path)
        if File.file?(path) && File.extname(path) == ".txt"
          ToyRobotSim::Parser.parse(path)
        else
          puts "Error: #{path} is an invalid file"
        end
      end

      def interactive

        say("Create a table...")

        width  = ask("Width : ").to_i
        height = ask("Height: ").to_i

        while width <= 0 || height <= 0
          say ("Table width and height need to be integers greater than zero")
          width  = ask("Width : ").to_i
          height = ask("Height: ").to_i
        end

        table = ToyRobotSim::Table.new(width, height)
        robot = ToyRobotSim::Robot.new(table)

        say("Instruction List")
        say( ("-"*80) )
        say('PLACE X,Y,F | F can be NORTH, EAST, SOUTH, WEST')
        say('MOVE        | Move forward one step')
        say('RIGHT       | Rotate clockwise')
        say('LEFT        | Rotate anti-clockwise')
        say('REPORT      | Current location of the robot')
        say('END         | Stops the simulation')
        say( ("-"*80) )
        say("Input an instruction (non case sensitive)")
        instruction = ask("Instruction: ")

        while instruction.upcase != 'END'
          ToyRobotSim::Parser.execute(robot, instruction.upcase)
          instruction = ask("Instruction: ")
        end

        say("Toy Robot Simulation Ended", Thor::Shell::Color::GREEN)
      end

    end
  end
end