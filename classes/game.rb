require './classes/item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date
  attr_reader :id

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @id = rand(1...1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    Time.now.year - Date.parse(@last_played_at).year > 2
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end
end
