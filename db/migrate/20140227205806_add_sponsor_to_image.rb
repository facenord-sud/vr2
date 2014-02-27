class AddSponsorToImage < ActiveRecord::Migration
  def change
    add_belongs_to :images, :sponsor, index: true
  end
end
