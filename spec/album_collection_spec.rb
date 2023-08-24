require_relative './lib/classes/album_collection'
require 'json'

describe AlbumCollection do
  before(:each) do
    @album_collection = Class.new
    @album_collection.extend(AlbumCollection)
    @album_collection.instantiate_common_variables
  end

  context 'create_album => asks user options to add a album' do
    it 'create_album with an incorrect time format for published_date => published date == Date.today' do
      # Mocking the creation of a book with user input;
      on_spotify = 'y'
      date = '2021'

      allow(@album_collection).to receive(:gets).and_return(on_spotify, date)

      @album_collection.create_album

      expect(@album_collection.albums[0].published_date).to eq Date.today
      expect(@album_collection.albums[0].on_spotify).to eq true
    end
    
  end
end