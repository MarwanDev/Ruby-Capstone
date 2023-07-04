require './classes/game'
require 'date'

describe Game do
  before :each do
    @game = Game.new '2018/06/15', true, '2023/07/04'
  end

  describe '#new' do
    it 'takes three parameters and returns a Game object' do
      @game.should be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'returns the correct publish_date' do
      @game.multiplayer.should be_truthy
    end
  end
  describe '#multiplayer' do
    it 'returns the correct publish_date' do
      @game.last_played_at.should eql '2023/07/04'
    end
  end
  describe '#publish_date' do
    it 'returns the correct publish_date' do
      @game.publish_date.should eql '2018/06/15'
    end
  end
  describe '#can_be_archived?' do
    it 'returns the whther it can be archived' do
      game = Game.new '2018-06-15', true, '2010-02-03'
      expect(game.can_be_archived?).to eql true
    end
    it 'returns the whther it can be archived' do
      game = Game.new '2018-06-15', true, '2022-02-03'
      expect(game.can_be_archived?).to eql false
    end
  end
end
