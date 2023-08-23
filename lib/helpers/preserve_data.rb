require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    base_folder = './lib/helpers/json'
    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    save_books
    save_albums
    save_games
    save_labels
    save_genres
    save_authors
  end

  def load_collections
    load_books
    load_albums
    load_games
    load_labels
    load_genres
    load_authors
  end

  private

end

