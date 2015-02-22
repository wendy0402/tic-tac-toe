#!/usr/bin/env ruby
require File.expand_path("../table",__FILE__)

class TicTacToe
  def initialize(size = 3)
    @table = Table.new(size)
  end

  def start_game
    @table.display
  end

  private

  def start_turn
    turn = 0
    # loop do
    #   turn += 1
    #   player = check_turn(turn)
    #   location = get_value(turn)
    #   table.update_table(location: location, sign: player)
    # end
  end

  def get_value(turn)
    puts "player #{player} turn"
    puts "location(format: x,y) : "
    structify_location(gets.chomp.split(','))
  end

  def check_turn(turn)
    turn.odd? ? "X" : "O"
  end

  private

  def structify_data(value)
    Struct.new(x: value[0], y: value[1])
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.start_game