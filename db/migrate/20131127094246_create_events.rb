class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :starting_at
      t.date :ending_at
      t.string :title
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
