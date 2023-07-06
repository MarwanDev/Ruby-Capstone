require './data/preserve_data'
require './classes/item'
require './classes/book'
class App
  attr_accessor :books, :labels, :items, :music_albums, :genres, :games, :authors

  # importing a class ==>      require './classes/book'   beware of ./
  # examples of using read and write data files
  # reading a file ==>    @books = file_read('data/books.json')     beware no / or ./
  # writing a file ==>    @books << Book.new(publish_date, publisher, cover_state).to_hash
  #                       file_write('./data/books.json', @books)
  # lets leave the examples until the last pull request
  def initialize
    @items = []
    @labels = []
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def list_all_books
    @books = file_read('data/books.json')
    puts 'No books found' if @books.empty?
    @books.each do |book|
      puts "ID: #{book['id']}",
           "Publish Date: #{book['publish_date']}, Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
    end
    puts '=========================='
  end

  def list_all_labels
    @labels = file_read('data/labels.json')
    puts 'No Labels found' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label['id']}, Name: #{label['name']}, Color: #{label['color']}"
    end
    puts '=========================='
  end

  def add_a_book
    print 'Enter publisher : '
    publisher = gets.chomp
    print 'Enter publish date : '
    publish_date = gets.chomp
    book = Book.new(publisher, publish_date)
    @books << book
    file_write('./data/books.json', @books)
  end

  def list_all_music_albums
    puts 'music albums'
  end

  def list_all_genres
    puts 'genres'
  end

  def add_a_music_album
    puts 'add music album'
  end

  def list_of_games
    puts 'games'
  end

  def list_all_authors
    puts 'authors'
  end

  def add_a_game
    puts 'add a games'
  end
end
