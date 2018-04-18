class Card
  attr_reader :rank, :suit, :points

  def initialize(options)
    self.rank = options[:rank]
    self.suit = options[:suit]
    self.points = options[:points]
  end

  private 

  def to_s
    "#{ rank } #{ suit }"
  end

  def to_str
    "#{ rank } #{ suit }"
  end

  attr_writer :rank, :suit, :points
end