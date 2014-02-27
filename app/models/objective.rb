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

class Objective < ActiveRecord::Base
end
