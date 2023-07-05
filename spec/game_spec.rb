require './classes/game'
require 'date'

describe Game do
  before :each do
    @game = Game.new '2018/06/15', true, '2023/07/04'
  end

  describe '#new' do
    it 'takes three parameters and returns a Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'returns the correct publish_date' do
      expect(@game.multiplayer).to be_truthy
    end
  end
  describe '#multiplayer' do
    it 'returns the correct publish_date' do
      expect(@game.last_played_at).to eql '2023/07/04'
    end
  end
  describe '#publish_date' do
    it 'returns the correct publish_date' do
      expect(@game.publish_date).to eql '2018/06/15'
    end
  end
  describe '#can_be_archived?' do
    it 'returns the whether it can be archived (true)' do
      game = Game.new '2018-06-15', true, '2010-02-03'
      expect(game.can_be_archived?).to eql true
    end
    it 'returns the whether it can be archived (false)' do
      game = Game.new '2018-06-15', true, '2022-02-03'
      expect(game.can_be_archived?).to eql false
    end
  end
end
