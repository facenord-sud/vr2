class AddRelationImageToGallery < ActiveRecord::Migration
  def change
    add_column :images, :galery_id, :integer
    add_index :images, :galery_id
  end
end
