require_relative '../game_controller' # rubocop:disable Style/FrozenStringLiteralComment
require_relative '../player'

describe GameController do
  subject(:game_controller) { described_class.new }

  before do
    allow(game_controller).to receive(:puts)
  end

  describe '#init_player' do
    context 'when a marker representation is provided by player' do
      before do
        allow(game_controller).to receive(:gets).and_return('John', 'A', 'B', 'X')
      end

      it 'keeps prompting for the marker until a valid input (X or O) is entered' do
        expect(Player).to receive(:new).with('John', 'X')
        game_controller.init_player
      end
    end
  end

  describe '#get_player_move' do
    context 'when move provided is a valid move' do
      before do
        allow(game_controller).to receive(:gets).and_return('1', '2')
      end

      it 'creates a move' do
        move = game_controller.get_player_move
        expect(move).to eq([1, 2])
      end
    end

    context 'when move provided is an invalid move' do
      before do
        allow(game_controller).to receive(:gets).and_return('5', '1', '5', '2', '1', '2')
      end

      it 'prompts user until valid move is provided' do
        move = game_controller.get_player_move
        expect(move).to eq([1, 2])
      end
    end
  end
end
