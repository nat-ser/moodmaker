class RemoveViewers < ActiveRecord::Migration
  def change
    remove_column :moods, :viewer, :string
  end
end
