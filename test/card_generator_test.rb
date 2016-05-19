require 'minitest/autorun'
require 'minitest/pride'
require '../lib/flashcards'
require '../lib/deck'
require '../lib/guess'
require '../lib/round'
require '../lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_generator_returns_array
    filename = "../lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Array, cards
  end

  def test_generator_array_has_cards
    filename = "../lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Card, cards.first
  end

  def test_generator_contains_question_and_answer
    filename = "../lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "What is 5 + 5?", cards.first.question
    assert_equal "10", cards.first.answer
  end


  def test_generator_contains_more_than_one_question_and_answer
    filename = "../lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "How much more black could this be?", cards.last.question
    assert_equal "none more black", cards.last.answer
  end
end
