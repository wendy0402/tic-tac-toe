require 'matrix'
class Board
  attr_reader :size
  attr_accessor :matrix

  def initialize(size)
    @size = size
    @matrix = Matrix.build(size){|row, col| "j"}
  end

  def rows
    matrix.to_a
  end

  def columns
    matrix.transpose.to_a
  end

  def full?
    !rows.flatten.include?(" ")
  end

  def diagonal_right
    diagonals = matrix.fields.group_by{|x,y| x + y}.values
    diagonal_values(diagonals)
  end

  def diagonal_left
    diagonals = matrix.fields.group_by{|x ,y| x - y}.values
    diagonal_values(diagonals)
  end

  def diagonal_values(diagonals)
    diagonals.map{ | diagonal| diagonal.map{ |fields| matrix[*fields] } }
  end

end
