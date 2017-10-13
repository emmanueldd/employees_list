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
  belongs_to :user
  belongs_to :mission, optional: true
  belongs_to :address, optional: true

  before_save :set_end_time, if: :start_time

  def set_end_time
    self.end_time = mission.present? ? start_time + mission.duration.minutes : start_time + 1.hour
  end

  def title
    mission.present? ? mission.name : 'untitled'
  end

  def address
    'temporary'
  end
end
