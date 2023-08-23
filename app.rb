require_relative 'lib/classes/album_collection'
class App
  include AlbumCollection

  def initialize
    instantiate_common_variables
  end
  OPTION_HANDLERS = {
    1 => :list_all_books,
    2 => :list_all_albums,
    3 => :list_all_games,
    4 => :list_all_genres,
    5 => :list_all_labels,
    6 => :list_all_authors,
    7 => :add_a_book,
    8 => :create_album,
    9 => :add_game,
    10 => :add_a_label,
    11 => :create_genre,
    12 => :add_a_author
    # ...
  }.freeze

  def display_menu
    # menu display logic
    puts "Please choose an option by entering a number:\n\n"
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - list all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Add a Label'
    puts '11 - Add a Genre'
    puts '12 - Add a Author'
    puts '13 - Exit'
    print 'Type your option: '
    gets.chomp.to_i
  end

  def handle_option(option, app)
    handler = OPTION_HANDLERS[option]
    handler&.call(app)
  end

  def list_all_books(app)
    app.list_all_books
  end

  def list_all_albums(app)
    app.list_all_albums
  end

  def list_all_games(app)
    app.list_all_games
  end

  def list_all_genres(app)
    app.list_all_genres
  end

  def list_all_labels(app)
    app.list_all_labels
  end

  def list_all_authors(app)
    app.list_all_authors
  end

  def add_a_book(app)
    app.add_a_book
  end

  def create_album(app)
    app.create_album
  end

  def add_game(app)
    app.add_game
  end

  def add_a_label(app)
    app.add_a_label
  end

  def create_genre(app)
    app.create_genre
  end

  def add_a_author(app)
    app.add_a_author
  end


  # Other handler methods ...

  def handle_invalid_option
    puts 'Invalid option'
  end
end
