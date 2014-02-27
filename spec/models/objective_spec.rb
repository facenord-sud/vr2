# == Schema Information
#
# Table name: objectives
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :string(255)
#  objective_list_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Objective do
  pending "add some examples to (or delete) #{__FILE__}"
end
