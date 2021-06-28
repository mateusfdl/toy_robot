require_relative './lib/parser.rb'
require_relative './lib/table.rb'
require_relative './lib/robot.rb'

table = Map.new(5,5)
robot = Robot.new
#factory_method = FactoryMethod.new(robot, table)

puts <<-INSTRUCTIONS
COOMANDS ALLOWED
 PLACE X,Y,Z
 MOVE ( LEFT RIGHT )
 REPORT
INSTRUCTIONS

loop do
  print '> ',  _ = gets.chomp

#  parsed_input = Parser.parse(_)
#
#  factory_method.run(parsed_input)
  return if _ == 'exit'
end
