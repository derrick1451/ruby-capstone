class Book < Item
  def initialize(publiser, cover_state)
    @publiser = publiser
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
