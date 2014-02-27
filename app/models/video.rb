# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :string(255)
#  to_gallery  :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Video < ActiveRecord::Base
  has_one :post
  accepts_nested_attributes_for :post, allow_destroy: true
  validates_presence_of :url
  validates_presence_of :title
end
