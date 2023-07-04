require './classes/item'

class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(publish_date)
    item = Item.new(publish_date)
    @items << item
    item.label = self
  end
end
