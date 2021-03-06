class Player
  BANK = 100
  attr_reader :name, :hand
  attr_writer  :ready_to_open
  attr_accessor :bank

  def initialize
    self.bank = BANK
    self.hand = Hand.new
  end

  def get_name
    loop do 
      p 'Please introduce yourself.'
      player_name = gets.strip.chomp.capitalize
      self.name = player_name

      break if !player_name.length.zero?
    end
  end

  def take(cards)
    self.hand.cards.concat cards
  end

  def move(game)
    action = gets.strip.chomp.to_i

    if action == 2
      self.take game.deck.give_cards(1)
    elsif action == 3
      self.ready_to_open = true
    end
  end

  def ready_to_open?
    ready_to_open
  end

  def reset_cards
    hand = Hand.new
  end

  private

  attr_writer :name, :hand
  attr_reader :ready_to_open
end