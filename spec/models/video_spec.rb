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

require 'spec_helper'

describe Video do
  pending "add some examples to (or delete) #{__FILE__}"
end
