class Portfolio < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  scope :published, -> { where(published: true) }

  validates_presence_of :image
end
