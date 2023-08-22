require 'date'

class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @label = params[:label]
    @publish_date = create_date(params[:publish_date])
    @archived = params[:archived] || false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end
  def add_author(author)
    @author = author
  end
end
