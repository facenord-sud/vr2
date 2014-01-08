class AddFieldsToevents < ActiveRecord::Migration
  def change
    add_column :events, :to_front, :boolean
    add_column :events, :image, :string
    add_column :events, :place, :string
  end
end
