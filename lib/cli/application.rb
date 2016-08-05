require 'thor'
require 'toy_robot_sim'

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

      method_option :interactive, desc: "Input commands interactively (PLACE x,y,f | MOVE | LEFT | RIGHT | REPORT ) ",
                                  aliases: "i"

      def start
        parser = ToyRobotSim::Parser.new

        if options[:directory]

          if Dir.exists?(options[:directory])
            Dir.chdir(options[:directory])

            puts "Parsing directory #{options[:directory]}..."
            puts "-"*80

            Dir.glob("*.txt") do |file|
              parser.parse(file)
              puts "-"*80
            end
          else
            puts "Error: #{options[:directory]} is an invalid directory"
          end

        elsif options[:file]

          if File.file?(options[:file]) && File.extname(options[:file]) == ".txt"
            parser.parse(options[:file])
          else
            puts "Error: #{options[:file]} is an invalid file"
          end

        elsif options[:interactive]

        end
      end

    end
  end
end