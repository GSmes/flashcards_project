require '../lib/flashcards'
require '../lib/deck'
require '../lib/guess'
require '../lib/round'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    card_array = File.read(@filename).each_line.map do |line|
      line.chomp.split(',')
    end
    card_array.map { |question, answer| Card.new(question, answer) }
  end
end
