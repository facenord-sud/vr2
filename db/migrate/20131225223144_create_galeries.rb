class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.string :title
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
