Dir[File.expand_path('../../libs/**/*.rb',__FILE__)].each { |f| require f}

class Game
  attr_reader :board

  def initialize(game_io = nil, config = nil)
    @game_io = game_io || GameIO.new(input: $stdin, output: $stdout)

    @config = config || Configuration.new(@game_io)
    @config.configure

    @board = Board.new(@config.size)
    @rules = Rules.new(@config.goal)
    @players = @config.player.clone
  end

  def play
    @game_io.print_board(@board)
    over = false
    until over
      @board = current_player.move(@board, @game_io)
      @game_io.print_board(@board)
      game_over? ? over = true : change_player
    end
  end

  def game_over?
    if @rules.player_won?(@board, current_player)
      @game_io.win!(current_player.mark)
      true
    elsif @rules.tie?(@board)
      @game_io.finish
      true
    else
      false
    end
  end

  def current_player
    @players.first
  end

  def change_player
    @players.rotate!
    @game_io.current_player(@players[0].mark)
  end
end