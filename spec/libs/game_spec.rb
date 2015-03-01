describe Game do
  before do
    config = double('config')
    @game = Game.new(nil, config)
  end

  it 'create new board' do
    expect(@game.board).to be_present
  end

  it 'get the next_player' do
    configuration
  end
end