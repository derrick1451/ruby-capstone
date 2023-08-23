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
  
end
