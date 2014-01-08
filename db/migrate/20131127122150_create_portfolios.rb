class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :image
      t.text :description
      t.boolean :published
      t.timestamps
    end
  end
end
