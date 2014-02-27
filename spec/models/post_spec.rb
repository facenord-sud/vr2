# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  published  :boolean
#  image      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  to_front   :boolean          default(FALSE)
#  video_id   :integer
#

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
