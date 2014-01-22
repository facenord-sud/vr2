class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :name
      t.string :description
      t.belongs_to :objective_list
      t.timestamps
    end
  end
end
