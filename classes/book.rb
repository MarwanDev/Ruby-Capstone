require './classes/item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state: "good")
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_hash
    {
      publish_date: @publish_date
      author: @author
      label: @label
      publisher: @publisher
    }
  end
end
