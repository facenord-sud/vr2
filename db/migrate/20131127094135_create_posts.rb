class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.string :image
      t.belongs_to :user
      t.timestamps
    end
  end
end
