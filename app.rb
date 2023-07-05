require './data/preserve_data'
require './classes/item'
require './classes/genre'
require './classes/music_album'
require './classes/game'

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
    @games = file_read('data/games.json')
    puts 'No games found' if @games.empty?

    @games.each do |game|
      puts "ID: #{game['id']}",
           "Publish Date: #{game['publish_date']}, Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
    end

    puts '=========================='
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
    @authors = file_read('data/authors.json')
    puts 'No Authors found' if @authors.empty?

    @authors.each do |author|
      puts "ID: #{author['id']}, Name: #{author['name']}"
    end

    puts '=========================='
  end

  def add_a_game
    puts 'add a game'
    puts 'Enter the game publish date:'
    publish_date = gets.chomp
    puts 'Is the game multiplayer? (Y/N)'
    multiplayer = gets.chomp
    multiplayer = true if %w[Y y].include?(multiplayer)
    multiplayer = false if %w[N n].include?(multiplayer)
    puts 'Last time the game was played'
    last_played_at = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_played_at)
    puts 'Game added!'
    file_write('./data/games.json', @games)

    puts '=========================='
  end
end
