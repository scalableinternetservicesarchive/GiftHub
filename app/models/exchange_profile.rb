class ExchangeProfile < ActiveRecord::Base
  belongs_to :user
  belongs_to :exchange
end
