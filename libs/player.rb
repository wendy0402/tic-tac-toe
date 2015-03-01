class Player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def move(board, io)
    while true
    move = io.get_move(board).split(',')
    return board if board.update_matrix(mark, x: move[0], y: move[1])
    io.warn_not_valid
    end
  end
end