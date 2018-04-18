class Dealer < Player
  
  def name
    'Dealer'
  end

  def move (game)
    cards_sum = game.deck.sum(self.cards)

    if cards_sum >= 17
      'skip'
    else
      self.take game.deck.give_cards(1)
      'took'
    end
  end

end