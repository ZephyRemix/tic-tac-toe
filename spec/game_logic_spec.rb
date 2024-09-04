require_relative '../game_logic' # rubocop:disable Style/FrozenStringLiteralComment
require_relative '../game_controller'
require_relative '../player'
require_relative '../marker'

describe GameLogic do # rubocop:disable Metrics/BlockLength
  subject(:game_logic) { described_class.new }
  let(:game_controller) { instance_double(GameController) }
  let(:players) { [player_one, player_two] }
  let(:player_one) { double('player_one', markers: [p1_marker1, p1_marker2, p1_marker3]) }
  let(:player_two) { double('player_two', markers: [p2_marker1, p2_marker2, p2_marker3]) }

  before do
    allow(game_controller).to receive(:announce_winner) # stub announce_winnner method
  end

  describe '#update_game' do # rubocop:disable Metrics/BlockLength
    shared_examples 'a winning condition' do
      it 'evaluates game_over to true' do
        expect { game_logic.update_game(players, game_controller) }.to change { game_logic.game_over }.from(false).to(true) # rubocop:disable Layout/LineLength
      end

      it 'announces the winner when found' do
        game_logic.update_game(players, game_controller)
        expect(game_controller).to have_received(:announce_winner).with(player_one)
      end
    end

    context 'when a horizontal win combination is achieved' do
      let(:p1_marker1) { double('p1_marker1', move: [1, 1]) }
      let(:p1_marker2) { double('p1_marker2', move: [1, 2]) }
      let(:p1_marker3) { double('p1_marker3', move: [1, 3]) }

      let(:p2_marker1) { double('p2_marker1', move: [1, 1]) }
      let(:p2_marker2) { double('p2_marker2', move: [1, 2]) }
      let(:p2_marker3) { double('p2_marker3', move: [2, 2]) }

      it_behaves_like 'a winning condition'
    end

    context 'when a vertical win combination is achieved' do
      let(:p1_marker1) { double('p1_marker1', move: [1, 1]) }
      let(:p1_marker2) { double('p1_marker2', move: [2, 1]) }
      let(:p1_marker3) { double('p1_marker3', move: [3, 1]) }

      let(:p2_marker1) { double('p2_marker1', move: [1, 1]) }
      let(:p2_marker2) { double('p2_marker2', move: [1, 2]) }
      let(:p2_marker3) { double('p2_marker3', move: [2, 2]) }

      it_behaves_like 'a winning condition'
    end

    context 'when a diagonal win combination is achieved' do
      let(:p1_marker1) { double('p1_marker1', move: [1, 1]) }
      let(:p1_marker2) { double('p1_marker2', move: [2, 2]) }
      let(:p1_marker3) { double('p1_marker3', move: [3, 3]) }

      let(:p2_marker1) { double('p2_marker1', move: [1, 1]) }
      let(:p2_marker2) { double('p2_marker2', move: [1, 2]) }
      let(:p2_marker3) { double('p2_marker3', move: [2, 2]) }

      it_behaves_like 'a winning condition'
    end

    context 'when no win combination is achieved' do
      let(:p1_marker1) { double('p1_marker1', move: [1, 1]) }
      let(:p1_marker2) { double('p1_marker2', move: [2, 3]) }
      let(:p1_marker3) { double('p1_marker3', move: [3, 3]) }

      let(:p2_marker1) { double('p2_marker1', move: [1, 1]) }
      let(:p2_marker2) { double('p2_marker2', move: [1, 2]) }
      let(:p2_marker3) { double('p2_marker3', move: [2, 2]) }

      it 'retains game_over as false' do
        expect { game_logic.update_game(players, game_controller) }.not_to(change { game_logic.game_over })
      end
    end
  end
end
