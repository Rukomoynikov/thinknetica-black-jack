class Hand
  attr_reader :cards

  def initialize()
    self.cards = []
  end

  def sum
    sum = 0
    a_cards = cards.select { |card| card.rank == 'A' }
    normal_cards = cards.select { |card| card.rank != 'A' }
    
    sum = normal_cards .map{ |card| card.points } .reduce(:+)

    if sum <= 10 && a_cards.count == 1
      sum += 11
    else
      sum += a_cards.count * 1
    end

    sum
  end

  private 

  attr_writer :cards
end