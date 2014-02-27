class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :description
      t.boolean :to_gallery

      t.timestamps
    end
  end
end
