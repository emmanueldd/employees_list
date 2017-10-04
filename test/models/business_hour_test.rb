# == Schema Information
#
# Table name: business_hours
#
#  id         :integer          not null, primary key
#  pro_id     :integer
#  date       :date
#  week_day   :integer
#  start_time :time
#  end_time   :time
#  open       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BusinessHourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
