require '../lib/flashcards'
require '../lib/deck'
require '../lib/guess'

class Round
  attr_reader :guesses, :deck

  attr_accessor :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards[guesses.count]
  end

  def record_guess(guess)
    if guess == deck.cards[guesses.count].answer
      @number_correct += 1
    end

    @guesses << Guess.new(guess, deck.cards[guesses.count])
  end

  def percent_correct
    ((@number_correct.to_f / @guesses.count.to_f) * 100).round(2)
  end
end
