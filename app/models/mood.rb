class Mood < ActiveRecord::Base
  has_many :movies
end
