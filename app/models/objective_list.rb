# == Schema Information
#
# Table name: objective_lists
#
#  id         :integer          not null, primary key
#  main       :text
#  created_at :datetime
#  updated_at :datetime
#

class ObjectiveList < ActiveRecord::Base

  has_many :objectives
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
end
