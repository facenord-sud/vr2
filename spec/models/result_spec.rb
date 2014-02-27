# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  date       :date
#  point      :integer
#  name       :string(255)
#  comp       :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Result do
  pending "add some examples to (or delete) #{__FILE__}"
end
