# == Schema Information
#
# Table name: unavailabilities
#
#  id         :integer          not null, primary key
#  pro_id     :integer
#  date       :datetime
#  week_day   :integer
#  hours      :text             default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UnavailabilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
