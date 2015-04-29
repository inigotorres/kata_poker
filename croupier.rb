class Croupier
  RANK = "Highest card"
  SEPARATOR = ": "
  WINSWITH = " wins with " + RANK + SEPARATOR
  TIE = "There is a tie"

  def self.check hand_one_description, hand_two_description
    player_one_hand = Hand.new(hand_one_description)
    player_two_hand = Hand.new(hand_two_description)
    
    comparison = player_one_hand <=> player_two_hand
    winner = "Player one"
    winner = "Player two" if comparison == -1
    winner_card = player_one_hand.winner_card_of_comparison 

    result = winner + WINSWITH + winner_card 
    result = TIE if comparison == 0
    result
  end

  def self.check_hand a_hand_description
    a_hand = Hand.new(a_hand_description)
    RANK + SEPARATOR + a_hand.highest_card.to_s
  end
end
