class GameIO
  def initialize(opt = {})
    @in_stream = opt[:input]
    @out_stream = opt[:output]
  end

  def current_player(mark)
    @out_stream.puts "Player #{mark}, your turn"
  end

  def request_mark
    request_message('choose player 1 mark(X or O): ', ['X','O'])
  end

  def set_size
    request_message('choose your board size(3 - 10): ', (3..10).to_a.map(&:to_s))
  end

  def set_goal
    request_message('choose your goal size(3 - 5): ', (3..5).to_a.map(&:to_s))
  end

  def get_move(board)
    request_message('please choose place to put the mark (x,y): ', board.valid_move)
  end

  def print_board(board)
    num = ""
    (0...board.size).each do |n|
      num << "#{n} "
    end
    puts "- #{num}"

    matrix = board.matrix
    board.size.times do |n|
      print "#{n} "
      @out_stream.puts matrix.row(n).to_a.join('|')
    end
  end

  def warn_not_valid
    @out_stream.puts "input not valid"
  end

  def win!(mark)
    @out_stream.puts "player #{mark} win!!"
  end

  def finish
    @out_stream.puts "THE GAME IS OVER!"
  end


  def request_message(message = "", allowed_input = [])
    input = ""

    until valid?(allowed: allowed_input, input: input)
      @out_stream.print message
      input = @in_stream.gets.chomp
    end
    input
  end

  def valid?(opts = {})
    opts[:allowed].empty? ? !opts[:input].empty? : opts[:allowed].include?(opts[:input])
  end
end