require_relative './music_album'
require_relative './genre'
require_relative '.item'
require_relative '../helpers/collection_handler'

module AlbumCollection
  include CollectionHandler
  def list_all_albums(albums: @albums)
    return if check_empty(albums, 'Albums', '8')

    albums.each_with_index do |album, idx|
      puts "[#{idx}] - #{album}"
    end
    puts ''
  end
  def list_all_genres(genres: @genres)
    return if check_empty(genres, 'Genres', '11')

    genres.each_with_index do |genre, idx|
      puts "[#{idx}] - #{genre}"
    end
    puts ''
  end
  def create_album
    input = nil
    on_spotify = nil
    while input != 'y' && input != 'n'
      print 'On Spotify? [Y/N]: '
      input = gets.chomp.downcase
      case input
      when 'y'
        on_spotify = true
      when 'n'
        on_spotify = false
      else
        puts 'Wrong input! Please try type Y/y for yes or N/n for no:'
      end
    end
    print 'Published Date: '
    published_date = gets.chomp
    @albums << MusicAlbum.new(on_spotify, published_date)
  end

end
