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

class Unavailability < ApplicationRecord
  belongs_to :pro
  attr_accessor :start_index, :end_index, :hours_to_block

  before_save :set_hours

  def set_hours
    if hours_to_block
      self.hours = unavailability_arr(start_index, end_index)
    else
      before_hours = unavailability_arr(0, start_index)
      after_hours = unavailability_arr(end_index, 23)
      self.hours = before_hours + after_hours
    end
  end

  def unavailability_arr(start_time, end_time)
    arr = []
    (start_time..end_time).each do |n|
      arr.push "%.2i" %n + ":00"
      arr.push "%.2i" %n + ":30"
    end
    arr
  end

end
