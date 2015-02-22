class Player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def move(table)
    flag = true
    while flag do
      puts "player #{mark} turn"
      print "location(format: x,y) : "
      STDOUT.flush
      coordinate = gets.chomp.split(',')

      if coordinate.size == 2
        coordinate = structify_location(coordinate)
        flag = table.check_grid(coordinate)
      else
        puts "You put wrong format"
      end
    end
    coordinate
  end

  private

  def structify_location(value)
    {x: value[0], y: value[1]}
  end
end