require 'minitest/autorun'
require 'minitest/pride'
require '../lib/flashcards'
require '../lib/guess'

class GuessTest < Minitest::Test

  def test_guess_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end

  def test_guess_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
  end

  def test_guess_contains_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_guess_response_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_guess_response_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Seattle", card)
    assert_equal false, guess.correct?
  end

  def test_guess_gives_feedback_if_correct
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Mercury", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_guess_gives_feedback_if_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect.", guess.feedback
  end
end
