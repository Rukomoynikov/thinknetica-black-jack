class Game
  attr_reader :menu, :player, :deck, :dealer, :message_panel, :bank

  def initialize(options)
    self.menu = options[:menu]
    self.player = options[:player]
    self.dealer = options[:dealer]
    self.message_panel = options[:message_panel]
    self.bank = 0
  end

  def start
    player.get_name if player.name.nil?

    renew_deck
    message_panel.game_starting
    send_starting_cards
    bet
    move
  end

  private 

  def renew_deck
    self.deck = Deck.new
  end

  def send_starting_cards
    player.take deck.give_cards(2)
    dealer.take deck.give_cards(2)
  end

  def bet
    self.player.bank -= 10 
    self.dealer.bank -= 10 
    self.bank += 20
  end

  def move
    message_panel.dashboard(player, dealer, self)

    message_panel.move_menu

    player.move (self)
    message_panel.dashboard(player, dealer, self)
    dealer.move (self)
    message_panel.dashboard(player, dealer, self)
  end

  attr_writer :menu, :player, :deck, :dealer, :message_panel, :bank
end