require_relative '../lib/classes/author'
require_relative '../lib/classes/item'
require 'JSON'

describe Author do
  describe 'Testing the author class' do
    context 'When creating new author class' do
      it 'Should create a new author when we call the class new method' do
        new_author = Author.new('first name', 'Last name')
        expect(new_author.first_name).to eq 'first name'
        expect(new_author.last_name).to eq 'Last name'
      end
    end
  end

  describe 'Testing the author class methods' do
    context 'When an item adds the add_author method it should save the items in author class' do
      it 'Should fill an array with items' do
        item1 = Item.new(3)
        new_author = Author.new('first name', 'Last name')
        item1.add_author(new_author)
        expect(new_author.items).to have_attributes(size: 1)

        item2 = Item.new(10)
        item2.add_author(new_author)
        expect(new_author.items).to have_attributes(size: 2)
      end
    end

    context "When an item it's in the array should not save it again" do
      it 'Should cancel the method' do
        item1 = Item.new(3)
        new_author = Author.new('first name', 'Last name')
        item1.add_author(new_author)
        expect(new_author.items).to include item1

        item1.add_author(new_author)
        puts new_author.items
        expect(new_author.items.length).to eq 1
      end
    end
  end


  describe "#to_s" do
      
    it "returns author name formatted correctly" do
      author = Author.new("John", "Doe")
      expected = "Id: #{author.id}, First Name: John, Last Name: Doe"

      expect(expected).to eq author.to_s
    end

  end

  describe "#to_json" do

    it "serializes author to json" do
      author = Author.new("Jane", "Doe")
      json = author.to_json

      data = JSON.parse(json)

      expect("Jane").to eq data["first_name"]
      expect( "Doe").to eq data["last_name"]
        expect( []).to eq data["items"]
    end

  end

  describe ".from_json" do

    it "deserializes author from json" do
      json = '{"first_name":"James","last_name":"Joyce"}'
      author = Author.from_json(JSON.parse(json))

      expect( "James").to eq author.first_name
      expect("Joyce").to eq author.last_name
    end

  end


end
