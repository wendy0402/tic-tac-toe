require 'matrix'
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end

  def fields
    each_with_index.map{ |val, row, col|[row, col] }
  end
end