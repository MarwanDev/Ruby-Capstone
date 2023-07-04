require './data/preserve_data'
require './classes/item'
require './classes/genre'
require './classes/music_album'

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
    puts 'books'
  end

  def list_all_labels
    puts 'labels'
  end

  def add_a_book
    puts 'add a book'
  end

  def list_all_music_albums
    @music_albums = file_read('data/music_albums.json')
    puts 'No music albums found' if @music_albums.empty?

    @music_albums.each do |album|
      puts "ID: #{album['id']}",
           "Publish Date: #{album['publish_date']}, On Spotify: #{album['on_spotify']}"
    end

    puts '=========================='
  end

  def list_of_games
    puts 'games'
  end

  def list_all_genres
    @genres = file_read('data/genres.json')
    puts 'No Genres found' if @genres.empty?

    @genres.each do |genre|
      puts "ID: #{genre['id']}, Name: #{genre['name']}"
    end

    puts '=========================='
  end

  def add_a_music_album
    puts 'Enter the albums publish date:'
    publish_date = gets.chomp
    puts 'Is the album on spotify? (Y/N)'
    on_spotify = gets.chomp
    on_spotify = true if %w[Y y].include?(on_spotify)
    on_spotify = false if %w[N n].include?(on_spotify)
    @music_albums << MusicAlbum.new(publish_date, on_spotify).to_hash
    puts 'Music album added!'
    file_write('./data/music_albums.json', @music_albums)

    puts '=========================='
  end

  def list_all_authors
    puts 'authors'
  end

  def add_a_game
    puts 'add a games'
  end
end
