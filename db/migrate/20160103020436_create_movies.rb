class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    t.string :name
    t.string :director
    t.string :info
    t.integer :effect_rating
    t.integer :mood_id
  end
  end
end
