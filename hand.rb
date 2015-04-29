class Hand
  FACE_VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
  LARGER = 1
  EQUAL = 0
  SMALLER = -1
  INDEX_OFFSET = -1

  attr_reader :hand_description

  def initialize hand_description
    @hand_description = hand_description
  end
  
  def highest_card
    sorted_cards = sort_hand(@hand_description)
    sorted_cards.first
  end

  def <=> to_compare
    first_hand_sorted = sort_hand(@hand_description)
    second_hand_sorted = sort_hand(to_compare.hand_description)
    
    comparison = EQUAL
    (1..5).each do |position|
      first_hand_next_highest_card = first_hand_sorted[position+INDEX_OFFSET]
      second_hand_next_highest_card = second_hand_sorted[position+INDEX_OFFSET] 

      next if (first_hand_next_highest_card.worth == second_hand_next_highest_card.worth)
      comparison = LARGER if (first_hand_next_highest_card.worth > second_hand_next_highest_card.worth)
      comparison = SMALLER if (first_hand_next_highest_card.worth < second_hand_next_highest_card.worth)
      break
    end
    comparison
  end

  def sort_hand a_hand
    cards_descriptions = a_hand.split(" ")
    cards = cards_descriptions.map {|description| Card.new(description)}
    sorted_cards = []
    FACE_VALUES.reverse.each do |value|
      cards.each do |card|
        sorted_cards << card if card.value == value
      end
    end
    sorted_cards
  end
end
