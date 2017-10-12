module Interface
  class BookingsController < InterfaceController

    def index
      @booking = Booking.new()
      @business_hour = current_pro.business_hours.new(open: false)
      @unavailabilites = current_pro.unavailabilities
      date = params[:date].present? ? params[:date].to_date : Date.today
      @bookings = current_pro.bookings.where(start_time: date.beginning_of_month..date.end_of_month)
    end

    def select_calendar
      # On clique sur connecter mon calendrier à mon google agenda
      # Call js/ajax sur select_calendar
      # en cas de succes, on retourne le json de select_calendar, mis en forme dans un formulaire qui édite le user (radios)
      # On enregistre le formulaire, cela update le calendar_id du user
      render json: add_event_to_google_calendar
    end

    def create
      @booking = Booking.new(booking_params)
      @booking.pro ||= @booking.mission.pro
      if @booking.save!
        gcw = GoogleCalendarWrapper.new(current_pro)
        redirect_back(fallback_location: root_path) if gcw.create_event(@booking)
      end
    end

    private
    def booking_params
      params.require(:booking).permit(:mission_id, :start_time, :pro_id)
    end
  end
end
