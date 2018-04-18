class Deck
  attr_reader :cards, :reserved_cards

  def initialize
    self.cards = []
    self.reserved_cards = []

    generate_new
  end

  def give_cards(count)
    selected_cards = []

    count.times do 
      card_index = rand(cards.length)
      card  = cards.delete_at(card_index)

      reserved_cards << card
      selected_cards << card
    end

    selected_cards
  end

  def sum(user_cards)
    sum = 0
    a_cards = user_cards.select { |card| card.rank == 'A' }
    normal_cards = user_cards.select { |card| card.rank != 'A' }
    
    sum = normal_cards .map{ |card| card.points } .reduce(:+)

    if sum <= 10 && a_cards.count == 1
      sum += 11
    else
      sum += a_cards.count * 1
    end

    sum
  end

  private 

  attr_writer :cards, :reserved_cards

  def generate_new
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        self.cards << Card.new(suit: suit, rank: rank, points: card_points(rank) )
      end
    end
  end

  def card_points(card)
    if %W(2 3 4 5 6 7 8 9 10 ).include?(card)
      card.to_i
    elsif %W(J Q K).include?(card)
      10
    else 
      'T'
    end
  end

end