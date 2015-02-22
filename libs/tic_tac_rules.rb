class TicTacRules
  def initialize(board_size)
    @board_size = board_size
  end

  def win?(table, opts = {})
    solutions(table).each do |solution|
      result = solution.map{|x| table.val_pos[x]}

      if !result.uniq.include?(" ") && result.uniq.length == 1
        puts solution
        return true
      end
    end
    false
  end

  private

  def solutions(table)
    grids = (1 .. table.size ** 2)
    horizontal = grids.each_slice(table.size).to_a
    vertical  = horizontal.transpose

    diagonal_right = grids.select {|index|
      ((index - 1) % (table.size - 1) == 0) && (index > 1) && (index < grids.count)
    }

    diagonal_left = grids.select {|index| (index - 1) % (table.size + 1) == 0}

    horizontal + vertical + [diagonal_left] + [diagonal_right]
  end
end