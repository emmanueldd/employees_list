module Interface
  class DashboardController < InterfaceController
    before_action :authenticate_pro!

    def index
      @title = 'Tableau de bord'
      @business_hour = current_pro.business_hours.new(open: false)
      @unavailabilites = current_pro.unavailabilities
      date = params[:date].present? ? params[:date] : Date.today
      @bookings = current_pro.bookings.where(start_time: date.beginning_of_week..date.end_of_week)
    end
  end
end
