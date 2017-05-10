require 'card'

class Deck
  attr_accessor :house

  def self.build_deck
    result = []
    Card::SUITES.keys.each do |suite|
      Card::VALUES.keys.each do |value|
        result << Card.new(value, suite)
      end
    end
    result
  end

  def initialize(house = Deck.build_deck)
    @house = house
    # build_deck

  end

end
