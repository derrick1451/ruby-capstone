require 'date'
class Item
  attr_reader :genre, :author, :label
  attr_accessor :id, :archived, :publish_date

  def initialize(publish_date)
    @publish_date = publish_date
    @id = Random.rand(1...1000)
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    diff = Time.now.year - @publish_date

    diff > 10
  end
end
