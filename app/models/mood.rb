class Mood < ActiveRecord::Base
  has_many :movies
  validates_presence_of :name, message: "You need to talk about your feeeelings!!"

  def slug
    name.downcase.gsub(/[^\w\s]/, "").gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|song| song.slug == slug}
  end
end
