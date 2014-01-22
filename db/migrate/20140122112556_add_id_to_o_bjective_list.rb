class AddIdToOBjectiveList < ActiveRecord::Migration
  def change
   # add_column :objectives, :objective_list, :integer
    #add_index :objectives, :objective_list
    add_belongs_to :images, :objective_list
  end
end
