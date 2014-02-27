# == Schema Information
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Sponsor < ActiveRecord::Base
  extend Enumerize
  enumerize :category, in: [:gold, :silver, :bronze, :partner]

  has_one :image

  accepts_nested_attributes_for :image, allow_destroy: true
end
