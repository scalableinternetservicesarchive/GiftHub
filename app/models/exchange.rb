class Exchange < ActiveRecord::Base
  has_many :exchange_questions
  has_many :questions, :through => :exchange_questions
  has_many :exchange_profiles
  accepts_nested_attributes_for :exchange_profiles
end
