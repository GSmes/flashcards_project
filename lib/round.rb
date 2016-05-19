class Round
  attr_reader :guesses, :deck

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    deck.cards[guesses.count]
  end

  def record_guess(guess)
    @guesses << Guess.new(guess, deck.cards[guesses.count])
  end
end
