class Rules
  def initialize(goal)
    @goal = goal
  end

  def player_won?(board, player)
    solutions = board.rows + board.columns + board.diagonal_right + board.diagonal_left
    solutions.each.any? do |sequences|
      mark_streak?(sequences, player)
    end
  end

  def tie?(board)
    board.full?
  end

  private

  def mark_streak?(sequences, player)
    sequences.each_index.any? do |index|
      sequence = sequences[index .. index + (@goal - 1)]
      sequence.uniq == [player.mark] && sequence.size == @goal
    end
  end
end