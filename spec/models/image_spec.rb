# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  asset             :string(255)
#  legend            :text
#  title             :string(255)
#  post_id           :integer
#  portfolio_id      :integer
#  event_id          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  galery_id         :integer
#  objective_list_id :integer
#  sponsor_id        :integer
#

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end
