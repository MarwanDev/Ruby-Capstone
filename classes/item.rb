require 'date'
class Item
  attr_accessor :genres, :authors, :labels, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @genres = []
    @authors = []
    @labels = []
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      genres: @genres,
      authors: @authors,
      labels: @labels
    }
  end
end
