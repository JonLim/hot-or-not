class RemoveHasSeenAndLiked < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.remove :has_seen, :has_liked
      t.float :avg_rating
      t.integer :times_rated
    end
  end
  
  def down
    change_table :people do |t|
      t.string :has_seen
      t.string :has_liked
      t.remove :avg_rating, :times_rated
    end
  end
end
