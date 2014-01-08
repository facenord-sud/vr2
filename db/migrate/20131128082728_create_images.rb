class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :asset
      t.text :legend
      t.string :title
      t.belongs_to :post
      t.belongs_to :portfolio
      t.belongs_to :event
      t.timestamps
    end
  end
end
