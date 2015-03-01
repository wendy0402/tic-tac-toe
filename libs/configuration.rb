class Configuration
  attr_reader :size, :player, :goal
  def initialize(game_io)
    @game_io = game_io
    @player = []
  end

  def configure
    set_size
    set_players_mark
    set_goal
  end

  def set_size
    @size = @game_io.set_size.to_i
  end

  def set_players_mark
    # mark1 = @game_io.request_mark
    # mark2 = (mark1 == 'X' ? 'O' : 'X')

    @player << Player.new("X")
    @player << Player.new("O")
  end

  def set_goal
    @goal = @game_io.set_goal(size).to_i
  end
end