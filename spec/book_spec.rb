require_relative '../lib/classes/book'
require 'rspec'
require 'json'
describe Book do
  before(:each) do
    @book8 = Book.new('2013-02-12', 'Orbit', 'Good', archived: false)
    @book2 = Book.new('2019-W05-6', 'Orbit', 'Bad', archived: false)
    @book10 = Book.new('20110212', 'Orbit', 'Good', archived: false)
    @book_wrong_date_format = Book.new('xxxx', 'Orbit', 'Good', archived: false)
  end

  context 'Checking the format of published_date instance variable' do
    it 'pub_date is in a wrong format => pub_date == Date.today' do
      expect(@book_wrong_date_format.published_date).to eq Date.today
    end
    it 'pub_date is correct => pub_date = Date.iso8601(pub_date)' do
      book10_date = '20110212'
      book2_date = '2019-W05-6'
      book8_date = '2013-02-12'
      expect(@book10.published_date).to eq Date.iso8601(book10_date)
      expect(@book8.published_date).to eq Date.iso8601(book8_date)
      expect(@book2.published_date).to eq Date.iso8601(book2_date)
    end
  end
  context 'move_to_archive => true || false' do
    it "Book was published < 10 yrs ago and condition == 'bad'" do
      # when the book is < 10 yrs old and cover_state == bad it can be archived!
      @book2.move_to_archive

      expect(@book2.archived).to eq true
    end
    it 'Book was published >= 10 yrs ago' do
      # when the book is >= 10 yrs old it can be archived!
      @book10.move_to_archive

      expect(@book10.archived).to eq true
    end
  end
end
describe '#to_json' do
  it 'converts to json with the correct attributes' do
    book = Book.new(Date.today, 'Penguin', 'good')

    expected = {
      id: book.id,
      archived: false,
      published_date: Date.today,
      publisher: 'Penguin',
      cover_state: 'good'
    }.to_json

    expect(book.to_json).to eq(expected)
  end
end
describe '.from_json' do
  it 'creates a Book from json data' do
    data = {
      published_date: Date.today.iso8601,
      publisher: 'Penguin',
      cover_state: 'good',
      archived: false
    }.to_json

    book = Book.from_json(JSON.parse(data))

    expect(book.published_date).to eq(Date.today)
    expect(book.publisher).to eq('Penguin')
    expect(book.cover_state).to eq('good')
    expect(book.archived).to eq(false)
  end
end
describe '#to_s' do
  it 'formats the string correctly' do
    book = Book.new(Date.today, 'Penguin', 'good')

    expected = "Id: #{book.id}, Published at: #{Date.today}," \
               ' Publisher: Penguin, Cover State: good'

    expect(book.to_s).to eq(expected)
  end
end
