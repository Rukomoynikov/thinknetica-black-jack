class Player
  BANK = 100
  attr_reader :name, :cards, :bank
  attr_writer :bank

  def initialize
    self.bank = BANK
    self.cards = []
  end

  def get_name
    loop do 
      p 'Please introduce yourself.'
      player_name = gets.strip.chomp.capitalize

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
    end
  end

  private

  attr_writer :name, :cards
end