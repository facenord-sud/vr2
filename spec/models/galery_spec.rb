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

require 'spec_helper'

describe Galery do
  pending "add some examples to (or delete) #{__FILE__}"
end
