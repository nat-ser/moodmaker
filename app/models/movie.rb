class Movie < ActiveRecord::Base
  belongs_to :mood
  validates_presence_of :name,:director, :info, :effect_rating, :mood_id, message: "FILL IN ALL THE FIELDS!!"
  validates :effect_rating, numericality: { only_integer: true, message: "Fill in a number!!" }

  def slug
    name.downcase.gsub(/[^\w\s]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|song| song.slug == slug}
  end
end
