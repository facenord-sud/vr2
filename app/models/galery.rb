# == Schema Information
#
# Table name: galeries
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  to_cover    :boolean          default(FALSE)
#

class Galery < ActiveRecord::Base
  has_many :images, class_name: 'Image', dependent: :destroy
  belongs_to :user

end
