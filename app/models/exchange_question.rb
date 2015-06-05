class ExchangeQuestion < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :question
  has_one :response
end
