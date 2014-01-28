class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.text :description
      t.boolean :published
      t.timestamps
    end
  end
end
