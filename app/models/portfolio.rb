# == Schema Information
#
# Table name: portfolios
#
#  id          :integer          not null, primary key
#  description :text
#  published   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Portfolio < ActiveRecord::Base

  has_one :image, class_name: 'Image', dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  scope :published, -> { where(published: true) }

  validates_presence_of :image
end
