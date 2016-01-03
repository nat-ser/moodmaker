class Mood < ActiveRecord::Base
  has_many :movies
  validates_presence_of :name, message: "You need to talk about your feeeelings!!" 
end
