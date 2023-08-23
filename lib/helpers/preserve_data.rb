require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    base_folder = './lib/helpers/json'
    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    save_albums
    save_labels
    save_genres
    save_authors
  end

  def load_collections
    load_albums
    load_labels
    load_genres
    load_authors
  end

  private

  def save_albums
    albums_path = './lib/helpers/json/albums.json'

    json_albums = @albums.map(&:to_json)
    File.write(albums_path, JSON.generate(json_albums))
  end
  
  def save_labels
    labels_path = './lib/helpers/json/labels.json'

    json_labels = @labels.map(&:to_json)
    File.write(labels_path, JSON.generate(json_labels))
  end
  def save_genres
    genres_path = './lib/helpers/json/genres.json'

    json_genres = @genres.map(&:to_json)
    File.write(genres_path, JSON.generate(json_genres))
  end
  def save_authors
    authors_path = './lib/helpers/json/authors.json'

    json_authors = @authors.map(&:to_json)
    File.write(authors_path, JSON.generate(json_authors))
  end

  def load_albums
    albums_path = './lib/helpers/json/albums.json'
    return [] unless File.exist?(albums_path)

    file = File.open(albums_path)
    file_data = file.read if file
    albums_data = JSON.parse(file_data)
    albums_data.each do |data|
      json_data = JSON.parse(data)
      item = MusicAlbum.from_json(json_data)
      @albums << item
      @items[json_data['id']] = item
    end
  end

  def load_genres
    genres_path = './lib/helpers/json/genres.json'
    return [] unless File.exist?(genres_path)

    file = File.open(genres_path)
    file_data = file.read if file
    genres_data = JSON.parse(file_data)
    genres_data.each do |data|
      json_genre = JSON.parse(data)
      item_array = json_genre['items']
      new_genre = Genre.from_json(json_genre)
      load_relations(new_genre, item_array)
      @genres << new_genre
    end
  end

  def load_authors
    authors_path = './lib/helpers/json/authors.json'
    return [] unless File.exist?(authors_path)

    file = File.open(authors_path)
    file_data = file.read if file
    authors_data = JSON.parse(file_data)
    authors_data.each do |data|
      json_author = JSON.parse(data)
      item_array = json_author['items']
      new_author = Author.from_json(json_author)
      load_relations(new_author, item_array)
      @authors << new_author
    end
  end


end

