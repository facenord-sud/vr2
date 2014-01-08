class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.date :date
      t.integer :point
      t.string :name
      t.string :comp
      t.string :category

      t.timestamps
    end
  end
end
