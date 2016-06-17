class RenamePostsToPictures < ActiveRecord::Migration
  def change
    rename_table :posts, :pictures
  end
end
