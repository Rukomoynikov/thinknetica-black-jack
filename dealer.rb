class Dealer < Player
  
  def move (game)
  	cards_sum = game.deck.sum(self.cards)
  end

end