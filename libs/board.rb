require 'matrix'
class Board
  attr_reader :size
  attr_accessor :matrix

  def initialize(size)
    @empty_mark = "-"
    @size = size.to_i
    @matrix = Matrix.build(@size){|row, col| @empty_mark}
  end

  def update_matrix(val, opt = {})

    if (0..@size).include?(opt[:y].to_i) && (0..@size).include?(opt[:x].to_i)
      @matrix[opt[:y].to_i, opt[:x].to_i] = val
      return true
    end
    false
  end

  def valid_move
    valid = []
    @matrix.each_with_index do |val, row, col|
      valid << [col,row].join(',') if val.to_s == '-'
    end
    valid
  end

  def rows
    matrix.to_a
  end

  def columns
    matrix.transpose.to_a
  end

  def full?
    !rows.flatten.include?(@empty_mark)
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
