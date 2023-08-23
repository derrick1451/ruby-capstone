class Book
  def initialize(publiser, cover_state)
    @publiser = publiser
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end
end
