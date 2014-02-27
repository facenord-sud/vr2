class AddToCoverToGalery < ActiveRecord::Migration
  def change
    add_column :images, :to_cover, :boolean, :default => false
  end
end
