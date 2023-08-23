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
end

