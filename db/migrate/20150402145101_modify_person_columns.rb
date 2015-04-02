class ModifyPersonColumns < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.remove :avg_rating
      t.integer :times_liked
    end
  end
end
