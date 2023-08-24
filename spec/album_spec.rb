require_relative '../lib/classes/music_album'
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
  context 'When testing the Album methods' do
    it 'Should parse album data' do
      new_album = MusicAlbum.new(true, '20210101')
      expect(new_album.to_json(new_album)).to eq '{"on_spotify":true,"published_date":"2021-01-01","archived":false}'
    end
    it 'Should create instance from json' do
      # rubocop:disable Layout/LineLength
      new_album = MusicAlbum.from_json(JSON.parse('{"on_spotify":false,"published_date":"2021-01-01","archived":false}'))
      # rubocop:enable Layout/LineLength
      expect(new_album.on_spotify).to eq false
    end
  end

  describe '#to_json' do
    it 'converts album to json' do
      album = MusicAlbum.new(true, Date.today)
      json = album.to_json

      data = JSON.parse(json)

      expect(data['on_spotify']).to be true
      expect(data['published_date']).to eq Date.today.to_s
      expect(data['archived']).to be false
    end
  end

  describe '#to_s' do
    it 'displays album info' do
      album = MusicAlbum.new(false, Date.new(1990, 1, 1))
      expected = "Id: #{album.id}, Published at: #{Date.today}, On Spotify?: false"
      expect(album.to_s).to eq(expected)
    end
  end

  describe '.from_json' do
    it 'creates album from json' do
      json = '{"on_spotify":true,"published_date":"2000-01-01","archived":false}'
      album = MusicAlbum.from_json(JSON.parse(json))

      expect(album.on_spotify).to be true
      expect(album.published_date).to eq Date.new(2000, 1, 1)
      expect(album.archived).to be false
    end
  end
end
