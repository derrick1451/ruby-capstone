require_relative '../lib/classes/genre'
require_relative '../lib/classes/item'
require 'json'

describe Genre do
  context 'When testing creation of genre instance' do
    it 'Should create a genre when we call the class constructor' do
      new_genre = Genre.new('Test')
      expect(new_genre.name).to eq 'Test'
    end
  end
  context 'When testing genre methods' do
    it 'Should add a new item to the items array' do
      new_genre = Genre.new('Test')
      item = Item.new(2)
      new_genre.add_item(item)
      expect(new_genre.items.length).to eq 1
    end
  end

  describe '#to_json' do
    it 'converts to json' do
      cart = Genre.new('My Cart')
      cart.items << Item.new('Item 1')

      expect(cart.to_json).to eq({
        name: 'My Cart',
        items: [cart.items[0].to_json]
      }.to_json)
    end
  end

  describe '#to_s' do
    it 'returns string with id and name' do
      cart = Genre.new('My Cart')

      expect(cart.to_s).to eq("Id: #{cart.id}, Name: My Cart")
    end
  end

  describe '.from_json' do
    it 'creates a Cart from json' do
      json = { name: 'My Cart' }.to_json
      cart = Genre.from_json(JSON.parse(json))

      expect(cart.name).to eq('My Cart')
    end
  end
end
