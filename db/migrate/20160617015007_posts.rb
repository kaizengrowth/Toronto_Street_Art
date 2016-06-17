class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :intersection_id, null: false, index: true
      t.string :user_id, null: false, index: true
      t.string :img_url, null: false
      t.string :artist_name, index: true
      t.string :text
      t.timestamps
    end
  end
end
