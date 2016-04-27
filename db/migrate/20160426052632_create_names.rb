class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string "name"
      t.string "comment"
      t.integer "like_count"
      t.integer "dislike_count"
      t.timestamps null: false
    end
  end
end
