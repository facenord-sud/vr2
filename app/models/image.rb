class Image < ActiveRecord::Base

  mount_uploader :asset, ImageUploader

  belongs_to :post
  belongs_to :portfolio
  belongs_to :event
  belongs_to :galery
  belongs_to :objective_list

  validates_presence_of :asset
  validates_presence_of :title
end
