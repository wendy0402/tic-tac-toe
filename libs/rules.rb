class Rules
  def initialize(goal)
    @goal = goal
  end

  def player_won?(board, player)
    solutions = board.rows + board.columns + board.diagonal_right
    solutions.each.any? do |sequences|
      mark_streak?(sequences, player)
    end
  end

  def tie?(board)
    board.full?
  end

  def mark_streak?(sequences, player)
    sequences.each_index.any? do |index|
      sequences[index .. index + (@goal - 1) ].uniq == [player.mark]
    end
  end
end