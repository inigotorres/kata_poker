class Croupier
  RANK = "Highest card"
  SEPARATOR = ": "
  FACE_VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
  INDEX_OFFSET = -1
  WINSWITH = " wins with " + RANK + SEPARATOR
  TIE = "There is a tie"

  def self.check hand_one, hand_two
    player_one_sorted_hand = sort_hand(hand_one)
    player_two_sorted_hand = sort_hand(hand_two)

    winner = TIE
    (1..5).each do |position|
      player_one_next_highest_card = player_one_sorted_hand[position+INDEX_OFFSET] 
      player_two_next_highest_card = player_two_sorted_hand[position+INDEX_OFFSET] 
      
      next if player_one_next_highest_card.worth == player_two_next_highest_card.worth
      winner = "Player one" + WINSWITH + player_one_next_highest_card.to_s
      winner = "Player two" + WINSWITH + player_two_next_highest_card.to_s if (player_one_next_highest_card.worth < player_two_next_highest_card.worth)
      break
    end
    winner
  end

  def self.check_hand a_hand
    RANK + SEPARATOR + highest_card(a_hand).to_s
  end

  def self.highest_card a_hand
    sorted_cards = sort_hand a_hand
    sorted_cards.first 
  end

  def self.sort_hand a_hand
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
