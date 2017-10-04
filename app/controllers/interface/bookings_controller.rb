module Interface
  class BookingsController < InterfaceController

    def index
      @booking = Booking.new()
      @business_hour = current_pro.business_hours.new(open: false)
      @unavailabilites = current_pro.unavailabilities
      date = params[:date].present? ? params[:date].to_date : Date.today
      @bookings = current_pro.bookings.where(start_time: date.beginning_of_day..date.end_of_day)
    end

    def create
      @booking = Booking.new(booking_params)
      @booking.pro = @booking.mission.pro
      redirect_back(fallback_location: root_path) if @booking.save
    end

    private
    def booking_params
      params.require(:booking).permit(:mission_id, :start_time)
    end
  end
end
