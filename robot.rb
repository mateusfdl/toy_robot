# frozen_string_literal: true

require_relative './lib/map'
require_relative './lib/robot'
require_relative './lib/factory_method'

map = Map.new(5, 5)
robot = Robot.new
factory_method = FactoryMethod.new(map, robot)

puts <<~INSTRUCTIONS
  COOMANDS ALLOWED
   PLACE X Y FACING
   MOVE ( LEFT or RIGHT )
   REPORT
INSTRUCTIONS

loop do
  print '> '

  input = gets.chomp

  return if input =~ /EXIT/

  command = factory_method.parse input

  command&.run
end
