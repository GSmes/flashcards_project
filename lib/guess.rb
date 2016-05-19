require '../lib/flashcards'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  # def response
  #   @response
  # end
  #
  def correct?
    true if @response == card.answer
  end

  def feedback
    if @response == card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end
