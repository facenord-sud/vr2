# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  asset             :string(255)
#  legend            :text
#  title             :string(255)
#  post_id           :integer
#  portfolio_id      :integer
#  event_id          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  galery_id         :integer
#  objective_list_id :integer
#  sponsor_id        :integer
#

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
