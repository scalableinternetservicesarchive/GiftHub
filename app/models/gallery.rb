class Gallery < ActiveRecord::Base
  belongs_to :exchange
  has_many :photos
end
