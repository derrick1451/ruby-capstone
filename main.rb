require_relative 'lib/books/book_collection'
require_relative 'lib/music/album_collection'
require_relative 'lib/games/game_collection'

class Ap
  def menu
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

  def main; end
end
