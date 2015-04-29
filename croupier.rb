class Croupier
  RANK = "Highest card"
  SEPARATOR = ": "
  FACE_VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
  WINSWITH = " wins with " + RANK + SEPARATOR
  INDEX_OFFSET = -1

  def self.check hand_one, hand_two
    player_one_sorted_hand = sort_hand(hand_one)
    player_two_sorted_hand = sort_hand(hand_two)
    winner = ""

    (1..5).each do |position|
      player_one_next_highest_card = player_one_sorted_hand[position+INDEX_OFFSET] 
      player_two_next_highest_card = player_two_sorted_hand[position+INDEX_OFFSET] 
      
      next if worth(player_one_next_highest_card) == worth(player_two_next_highest_card)
      winner = "Player one" + WINSWITH + player_one_next_highest_card
      winner = "Player two" + WINSWITH + player_two_next_highest_card if (worth(player_one_next_highest_card) < worth(player_two_next_highest_card))
      break
    end
    winner
  end

  def self.check_hand a_hand
    RANK + SEPARATOR + highest_card(a_hand)
  end

  def self.highest_card a_hand
    sorted_cards = sort_hand a_hand
    sorted_cards.first 
  end

  def self.sort_hand a_hand
    cards = a_hand.split(" ")
    sorted_cards = []
    FACE_VALUES.reverse.each do |value|
      cards.each do |card|
        sorted_cards << card if value(card) == value
      end
    end
    sorted_cards
  end

  def self.worth card
    FACE_VALUES.index(value(card))
  end

  def self.value card
    card.chars.first
  end
end
