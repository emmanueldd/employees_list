module ApplicationHelper
  def namespace
    return controller_path.split('/').first
  end

  def devise_mapping_for(type)
    if type == 'User'
      return Devise.mappings[:user]
    elsif type == 'Pro'
      return Devise.mappings[:pro]
    end
  end

  def business_hours_for(pro, wday)
    bh = pro.business_hours.find_by(week_day: wday)
    if bh.start_time.present? && bh.end_time.present?
      return "#{I18n.l(bh.start_time, format: :short)} - #{I18n.l(bh.end_time, format: :short)}"
    end
  end

end
