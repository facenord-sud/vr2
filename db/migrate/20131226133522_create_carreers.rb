class CreateCarreers < ActiveRecord::Migration
  def change
    create_table :carreers do |t|
      t.string :name
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.timestamps
    end
  end
end
