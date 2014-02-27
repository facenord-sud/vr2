class AddALaUneToPost < ActiveRecord::Migration
  def change
    add_column :posts, :to_front, :boolean, default: false
    add_belongs_to :posts, :video, index: true
  end
end
