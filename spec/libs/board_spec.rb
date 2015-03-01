describe Board do
  before do
    @board = Board.new(4)
  end

  describe 'init' do
    it 'create matrix with size as init' do
      expect(@board.matrix.column_size).to eq(4)
      expect(@board.matrix.row_size).to eq(4)
    end

    it 'matrix all blank' do
      matrix = @board.matrix.to_a

      matrix = matrix.flatten.uniq

      expect(matrix.size).to eq(1)
      expect(matrix).to be_include('')
    end
  end

  describe 'full' do
    it 'true when all board marked' do
      @board.matrix = @board.matrix.map{|val| 'x'}

      expect(@board.full?).to be_truthy
    end
  end

  describe 'update matrix ' do
    it 'failed if size bigger than board size' do
      expect(@board.update_matrix(5, x: 5, y: 5)).to be_falsy
    end
    it 'failed does not update matrix' do
      @board.update_matrix(5, x: 5, y: 5)
      expect(@board.matrix[5,5]).to be_nil
    end

    it 'success' do
      expect(@board.update_matrix(5, x: 1, y: 1)).to be_truthy
      expect(@board.matrix[1,1]).to eq(5)
    end
  end

  context 'valid_move' do
    before do
      @board.update_matrix(5, x: 1, y: 1)
    end

    it 'does not include 1,1' do
      expect(@board.valid_move).to_not be_include('1,1')
    end
  end

end