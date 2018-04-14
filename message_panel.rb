class MessagePanel
  def game_starting
    p 'Game starting'
  end

  def dashboard(player, dealer, game)
    dealer_cards = dealer.cards.count.times.map { '*' }

    p '------------------------'
    p "| Casino bank: #{ game.bank }"
    p "| Player cards: #{ player.cards.join(', ') } | bank: #{ player.bank }"

    p "| Dealer cards: #{ dealer_cards.join(' ') } | bank: #{ dealer.bank }"
    p '------------------------'
  end

  def move_menu
    p '| Your turn:'
    p '| 1. Pass'
    p '| 2. Take card'
    p '| 3. Open cards'
    p '-----------------'    
  end

  def ready_to_open_cards
  end
end