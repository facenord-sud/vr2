class AddToGalleryToVideo < ActiveRecord::Migration
    def change
      add_column :videos, :to_gallery, :boolean, default: false
    end
end