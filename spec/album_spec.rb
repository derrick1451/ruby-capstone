require_relative './lib/classes/music_album'
require 'json'

describe MusicAlbum do
  context 'When testing creation of Album instance' do
    it 'Create a MusicAlbum with correct values for instance parameters' do
      new_album = MusicAlbum.new(true, '19970622')
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq Date.iso8601('19970622')
    end
    it 'Create a MusicAlbum with incorrect value for published_date' do
      new_album = MusicAlbum.new(true, 2)
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq Date.today
    end
  end
  context 'Album can be archived? true or false' do
    it 'album.move_to_archive => album.archived == true' do
      new_album = MusicAlbum.new(true, '20011202')
      new_album.move_to_archive
      expect(new_album.archived).to eq true
    end
    it 'album.move_to_archive => album.archived == false' do
      new_album = MusicAlbum.new(true, '20211202')
      new_album.move_to_archive
      expect(new_album.archived).to eq false
    end
  end
  
end