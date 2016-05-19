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
end
