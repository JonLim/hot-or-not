class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :imageurl
      t.string :has_seen
      t.string :has_liked

      t.timestamps null: false
    end
  end
end
