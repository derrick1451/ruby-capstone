class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1...10_000)
    @name = name
    @items = []
  end
end