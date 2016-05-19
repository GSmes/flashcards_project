require 'minitest/autorun'
require 'minitest/pride'
require '../lib/flashcards'
require '../lib/deck'
require '../lib/guess'
require '../lib/round'

class RoundTest < Minitest::Test

  def test_round_begins_with_zero_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_round_has_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_recording_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("93,000,000")
    assert_equal "93,000,000", round.guesses.last.response
  end

  def test_counting_recorded_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("93,000,000")
    assert_equal 2, round.guesses.count
  end

  def test_first_guess_returns_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_next_guess_returns_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("93,000,000")
    assert_equal "Correct!", round.guesses.last.feedback
  end

  def test_current_card_after_multiple_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal card_2, round.current_card
  end

  def test_count_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Juneau")  # correct
    round.record_guess("5")  # incorrect
    round.record_guess("Mars")  # correct
    assert_equal 2, round.number_correct
  end

  def test_percentage_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")  # incorrect
    card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Juneau")  # correct
    round.record_guess("5")  # incorrect
    round.record_guess("Mars")  # correct
    assert_equal 66.67, round.percent_correct
  end
end
