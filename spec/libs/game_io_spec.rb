describe GameIO do
  before do
    @input_stream = StringIO.new('Test', 'r')
    @output_stream = StringIO.new('', 'w')
    @game_io = GameIO.new(input: @input_stream, output: @output_stream)
  end

  it 'print something' do
    expect(@output_stream).to receive(:print)
    @game_io.request_message('passed')
  end

  it 'get request and response' do
    expect(@game_io.request_message('')).to eq('Test')
  end

  it 'validate input on request message' do
    expect(@game_io.valid?(input: 'TEST',allowed: ['TEHEE'])).to be_falsy
  end
end