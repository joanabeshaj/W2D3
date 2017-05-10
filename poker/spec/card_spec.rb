require 'rspec'
require 'card'
require 'deck'


describe Card do
  subject(:card) { Card.new(2, :hearts) }

  it "Card has a value" do
    expect(card.value).to eq(2)
  end

  it "Card has a suite" do
    expect(card.suite).to eq(:hearts)
  end

end


describe Deck do
  subject(:deck) { Deck.new }

  it "Deck starts with 52 cards" do
    expect(deck.house.length).to eq(52)
  end

  # it "Populates the house with card objects" do
  #   deck.build_deck
  #
  # end

end
