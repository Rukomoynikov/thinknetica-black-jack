class Player
  BANK = 100
  attr_reader :name, :cards, :bank
  attr_writer :bank, :ready_to_open

  def initialize
    self.bank = BANK
    self.cards = []
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
    self.cards.concat cards
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
    self.cards = []
  end

  private

  attr_writer :name, :cards
  attr_reader :ready_to_open
end