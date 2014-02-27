# == Schema Information
#
# Table name: carreers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  gold       :integer
#  silver     :integer
#  bronze     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Carreer < ActiveRecord::Base
end
