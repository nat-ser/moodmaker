class Movie < ActiveRecord::Base
  belongs_to :mood
  validates_presence_of :name,:director, :info, :effect_rating, :mood_id, message: "FILL IN ALL THE FIELDS!!"
  validates :effect_rating, numericality: { only_integer: true, message: "Fill in a number!!" }
end
