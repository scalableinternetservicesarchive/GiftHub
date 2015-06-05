
class QuestionResponse
  include ActiveRecord::Validations
  attr_accessor :responses

  validate :all_responses_okay

  def all_responses_okay
    responses.each do |resp|
      errors.add resp.errors unless resp.valid?
    end
  end

  def save
    responses.all?(&:save)
  end

  def responses=(incoming_data)
    incoming_data.each do |incoming|
      if incoming.respond_to? :attributes
        @responses << incoming unless @responses.include? incoming
      else
        if incoming[:id]
          target = @responses.select { |t| t.id == incoming[:id] }
        end
        if target
          target.attributes = incoming
        else
          @responses << Response.new(question_id: incoming[:id], user_id: current_user.id)
        end
      end
    end
  end

  def responses
    @responses || Response.all
  end
end