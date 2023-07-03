require 'securerandom'
require 'date'

# Item Class
class Item
  attr_accessor :genre, :author, :source, :label, :published_date
  attr_reader :id, :archived

  def initialize(genre, author, label, published_date)
    @id = SecureRandom.random_number(10_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    current_date = Date.today
    current_year = current_date.year
    current_year - published_date.year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
