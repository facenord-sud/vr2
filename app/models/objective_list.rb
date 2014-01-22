class ObjectiveList < ActiveRecord::Base

  has_many :objectives
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
end
