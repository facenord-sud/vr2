class Galery < ActiveRecord::Base
  has_many :images, class_name: 'Image', dependent: :destroy
  belongs_to :user
end
