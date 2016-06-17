class Intersections < ActiveRecord::Migration
  def change
    create_table :intersections do |t|
      t.string :street1, null: false, index: true
      t.string :street2, null: false, index: true
    end
  end
end
