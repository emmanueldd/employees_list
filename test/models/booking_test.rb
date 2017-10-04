# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  pro_id     :integer
#  mission_id :integer
#  price      :decimal(8, 2)
#  start_time :datetime
#  end_time   :datetime
#  status     :string
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
