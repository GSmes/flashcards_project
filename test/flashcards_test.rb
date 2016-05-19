require 'minitest/autorun'
require 'minitest/pride'
require '../lib/flashcards'
require '../lib/deck'

class CardTest < Minitest::Test

  def test_card_asks_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_contains_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end
  # 
  # def test_round_begins_with_zero_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   assert_equal [], round.guesses
  # end
  #
  # def test_round_has_deck
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   assert_equal deck, round.deck
  # end
  #
  # def test_current_card
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   assert_equal card_1, round.current_card
  # end
  #
  # def test_recording_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   round.record_guess("Juneau")
  #   round.record_guess("93,000,000")
  #   assert_equal "93,000,000", round.guesses.last.response
  # end
  #
  # def test_counting_recorded_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   round.record_guess("Juneau")
  #   round.record_guess("93,000,000")
  #   assert_equal 2, round.guesses.count
  # end
  #
  # def test_first_guess_returns_feedback
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   round.record_guess("Juneau")
  #   assert_equal "Correct!", round.guesses.first.feedback
  # end
  #
  # def test_next_guess_returns_feedback
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   round.record_guess("Juneau")
  #   round.record_guess("93,000,000")
  #   assert_equal "Correct!", round.guesses.last.feedback
  # end
  #
  # def test_current_card_after_multiple_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   round.record_guess("Juneau")
  #   assert_equal card_2, round.current_card
  # end
end
