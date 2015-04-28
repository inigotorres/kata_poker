require './croupier'

describe "A croupier in the casino " do
  context 'when checking a player hand' do
    it "identifies the highest card" do
      expect(Croupier.check_hand("2H 3D 5S 9C KD")).to eq("Highest card: KD")
      expect(Croupier.check_hand("2H 3D AS 9C KD")).to eq("Highest card: AS")  
      expect(Croupier.check_hand("2H 3D 4H 9C 6D")).to eq("Highest card: 9C") 
    end
  end

  context 'when checking two players hands' do
    it "identifies the winner with the highest card" do
      player_one_hand = "2H 3D 5S 9C KD"
      player_two_hand = "2H 3D 4H 9C 6D"
      expected = "Player one wins with Highest card: KD"
      reverse_expected = "Player two wins with Highest card: KD"
      expect(Croupier.check(player_one_hand,player_two_hand)).to eq(expected)
      expect(Croupier.check(player_two_hand,player_one_hand)).to eq(reverse_expected)
    end

    it "idenifies the winner when the highest card is the same" do
      expected = "Player one wins with Highest card: 4D"
      player_one_hand = "3H 4D 5S 9C KD"
      player_two_hand = "2H 3D 5S 9C KD"
      expect(Croupier.check(player_one_hand,player_two_hand)).to eq(expected)
    end
  end
end
