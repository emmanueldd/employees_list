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

class BusinessHour < ApplicationRecord
  belongs_to :pro

  after_save :set_unavailabilities

  default_scope { order(id: :asc) }
  scope :unavailable, -> { where(open: false) }

  def set_unavailabilities
    if start_time.present? && end_time.present?
      unavailability = pro.unavailabilities.find_or_initialize_by(week_day: week_day, date: date)
      unavailability.hours_to_block = date.present? || !self.open
      if !self.open
        unavailability.start_index = 0
        unavailability.end_index = 24
      else
        unavailability.start_index = start_time.strftime('%H').to_i
        unavailability.start_index -= 1 if date.nil?
        unavailability.end_index = end_time.strftime('%H').to_i
        unavailability.end_index -= 1 if date.present?
      end
      unavailability.save!
    end
  end
end
