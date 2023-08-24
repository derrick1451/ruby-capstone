require_relative 'lib/classes/album_collection'
class App
  include AlbumCollection

  def initialize
    instantiate_common_variables
  end

  def display_menu
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
  end

  def handle_option(option, app)
    case option
    when 1..6
      list(option, app)
    when 7..12
      add(option, app)
    end
  end

  def list(option, app)
    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_albums
    when 3
      app.list_all_games
    when 4
      app.list_all_genres
    when 5
      app.list_all_labels
    when 6

      app.list_all_authors
    end
  end

  def add(option, app)
    case option
    when 7
      app.add_a_book
    when 8
      app.create_album
    when 9
      app.add_game
    when 10
      app.add_a_label
    when 11
      app.create_genre
    when 12
      app.add_a_author
    end
  end
end
