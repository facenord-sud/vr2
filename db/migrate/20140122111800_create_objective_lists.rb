class CreateObjectiveLists < ActiveRecord::Migration
  def change
    create_table :objective_lists do |t|
      t.text :main
      t.timestamps
    end
  end
end
