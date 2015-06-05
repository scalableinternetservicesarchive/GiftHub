class Question < ActiveRecord::Base
  belongs_to :input_type
  belongs_to :exchange_question

  delegate :exchange, :to => :exchange_question, :allow_nil => true
end
