class ModifyPersonColumns < ActiveRecord::Migration
  def up
    change_table :people do |t|
      t.remove :avg_rating
      t.integer :times_liked
    end
  end
  
  def down
    change_table :people do |t|
      t.float :avg_rating
      t.remove :times_liked
    end
  end
end
