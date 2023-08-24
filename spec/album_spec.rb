require_relative './lib/classes/music_album'
require 'json'

describe MusicAlbum do
  context 'When testing creation of Album instance' do
    it 'Create a MusicAlbum with correct values for instance parameters' do
      new_album = MusicAlbum.new(true, '19970622')
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq Date.iso8601('19970622')
    end
end
end