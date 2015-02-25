describe Rules do
  before do
    @rules = Rules.new(3)
    @board = Board.new(6)
    @player = Player.new('x')
  end

  it 'over when n mark same horizontal' do

    @board.matrix[0,0] = 'x'
    @board.matrix[0,1] = 'x'
    @board.matrix[0,2] = 'x'

    expect(@rules.player_won?(@board, @player)).to be_truthy
  end

  it 'over when n mark same vertical' do

    @board.matrix[0,0] = 'x'
    @board.matrix[1,0] = 'x'
    @board.matrix[2,0] = 'x'
    expect(@rules.player_won?(@board, @player)).to be_truthy
  end

  it 'over when n mark same horizontal left' do

    @board.matrix[0,0] = 'x'
    @board.matrix[1,1] = 'x'
    @board.matrix[2,2] = 'x'
    expect(@rules.player_won?(@board, @player)).to be_truthy
  end

  it 'over when n mark same horizontal right' do

    @board.matrix[5,1] = 'x'
    @board.matrix[4,2] = 'x'
    @board.matrix[3,3] = 'x'
    expect(@rules.player_won?(@board, @player)).to be_truthy
  end

  it 'tie when board full' do
    @board.matrix = @board.matrix.map{|val| 'x'}
    expect(@rules.tie?(@board)).to be_truthy  
  end
end