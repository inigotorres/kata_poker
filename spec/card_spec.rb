require './card'

describe "A card" do
  context "When comparing cards" do
    it "knows if it is higher than another card" do
      a_card = Card.new("AS")
      another_card = Card.new("9D")
      expect(a_card <=> another_card).to eq(1)
    end

    it "knows if it is lower than another card" do
      a_card = Card.new("KD")
      another_card = Card.new("AH")
      expect(a_card <=> another_card).to eq(-1)
    end

    it "knows it is equal to another card" do
      a_card = Card.new("AS")
      another_card = Card.new("AS")
      expect(a_card <=> another_card).to eq(0)
    end

    it "knows it is not comparable" do
      a_card = Card.new("AS")
      expect(a_card <=> "AS").to be_nil
    end

    it "knows how to express in a string" do
      a_card = Card.new("AS")
      expect(a_card.to_s).to eq("AS")
    end
  end
end
