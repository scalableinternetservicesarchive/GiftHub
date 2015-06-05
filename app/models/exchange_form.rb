
class ExchangeForm
  attr_reader :questions
  attr_reader :responses

  def initialize(questions, responses)
    @questions = questions
    @responses = responses
  end
end