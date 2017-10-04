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

class Booking < ApplicationRecord
  belongs_to :pro
  belongs_to :mission

  before_save :set_end_time

  def set_end_time
    self.end_time = start_time + mission.duration.minutes
  end
end
