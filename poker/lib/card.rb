class Card

attr_accessor :value, :color, :suite

VALUES =
  { ace: "ace",
    two: "2",
    three: "3",
    four: "4",
    five: "5",
    six: "6",
    seven: "7",
    eight: "8",
    nine: "9",
    ten: "10",
    jack: "jack",
    queen: "queen",
    king: "king"
  }

  SUITES = {
    hearts: "hearts",
    diamonds: "diamonds",
    spades: "spades",
    clubs: "clubs"
  }

  def initialize(value, suite)
    @value = value
    @suite = suite
  end

end
