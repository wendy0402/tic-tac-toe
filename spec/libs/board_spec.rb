describe Board do
  before do
    @board = Board.new(4)
  end

  it 'create matrix with size as init' do
    expect(@board.matrix.column_size).to eq(4)
    expect(@board.matrix.row_size).to eq(4)
  end

  it 'matrix all blank' do
    matrix = @board.matrix.to_a

    matrix = matrix.flatten.uniq

    expect(matrix.size).to eq(1)
    expect(matrix).to be_include(" ")
  end

  it 'true when all board marked' do
    @board.matrix = @board.matrix.map{|val| 'x'}

    expect(@board.full?).to be_truthy
  end
end