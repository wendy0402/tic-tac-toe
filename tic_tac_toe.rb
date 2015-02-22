#!/usr/bin/env ruby
require File.expand_path("../tic_tac_rules", __FILE__)
require File.expand_path("../table",__FILE__) 
require File.expand_path("../player",__FILE__)
class TicTacToe
  def initialize(size = 3)
    @table  = Table.new(size)
    @tic_tac_rule   = TicTacRules.new(size)
  end

  def start_game
    puts "============================="
    puts "Welcome To Advance TicTacToe"
    puts "============================="
    puts "Time to play"

    @player1 = Player.new("X")
    @player2 = Player.new("O")

    @table.display
    start_turn
  end

  def stop(mark)
    puts "============================="
    puts "CONGRATULATION PLAYER #{mark}"
    puts "         YOU WON             "
    puts "============================="
  end

  def tie
    puts "============================="
    puts "     THE RESULT IS TIE       "
    puts "============================="

  end

  private

  def start_turn
    @table.total_grids.times do |n|
      player = check_turn(n)

      coordinate = player.move(@table)
      @table.update_table(coordinate: coordinate, mark: player.mark)

      if @tic_tac_rule.win?(@table, coordinate: coordinate)
        stop(player.mark)
        break
      end
      if n == @table.total_grids
        tie
        break
      end
    end
  end

  def check_turn(turn)
    turn.odd? ? @player1 : @player2
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.start_game