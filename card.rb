class Card
  FACE_VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
  LARGER = 1
  EQUAL = 0
  SMALLER = -1
  
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def <=> another_card
    result = SMALLER if worth < another_card.worth
    result = LARGER if worth > another_card.worth
    result = EQUAL if worth == another_card.worth
    result
  end

  # private eliminated because need to invoke another_card method
  # hence it can't be private
  def worth
    FACE_VALUES.index(value)
  end

  def value
    @description.chars.first
  end
end
