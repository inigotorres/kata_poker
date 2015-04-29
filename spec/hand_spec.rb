require './hand'

describe "A poker hand" do
  it "knows its largest card" do
    expect(Hand.new("2H 5S 3D 9C KD").highest_card.to_s).to eq("KD")
  end

  it "can be compared by highest card" do
    a_hand = Hand.new("3H 4D 5S 9C KD")
    another_hand = Hand.new("2H 3D 5S 9C QD")
    expect(a_hand <=> another_hand).to eq(1)
    expect(another_hand <=> a_hand).to eq(-1)
    expect(a_hand <=> a_hand).to eq(0)
  end

  it "can be compared by best card values" do
    a_hand = Hand.new("3H 4D 5S 9C KD")
    another_hand = Hand.new("2H 3D 5S 9C KD")
    expect(a_hand <=> another_hand).to eq(1)
    expect(another_hand <=> a_hand).to eq(-1)
    expect(a_hand <=> a_hand).to eq(0)
  end
end
