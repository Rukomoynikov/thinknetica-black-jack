class Card
  SUITS = %W(♦ ♣ ♠ ♥)
  RANKS = %W(2 3 4 5 6 7 8 9 10 J Q K A)

  attr_reader :rank, :suit, :points

  def initialize(options)
    self.rank = options[:rank]
    self.suit = options[:suit]
    self.points = options[:points]

    raise 'Wrong format' if !valid?
  end

  private 

  def to_s
    "#{ rank } #{ suit }"
  end

  def to_str
    "#{ rank } #{ suit }"
  end

  def valid?
    SUITS.include?(suit) && RANKS.include?(rank)
  end

  attr_writer :rank, :suit, :points
end