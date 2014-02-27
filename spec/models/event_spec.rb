# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  starting_at :date
#  ending_at   :date
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  to_front    :boolean
#  image       :string(255)
#  place       :string(255)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
