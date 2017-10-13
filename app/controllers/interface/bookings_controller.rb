module Interface
  class BookingsController < InterfaceController
    before_action :set_booking, only: [:show, :edit, :update]

    def index
      @bookings = current_user.bookings
    end

    def show
    end

    def edit
      @pro = @booking.pro
    end

    def update
      redirect_to interface_bookings_path if @booking.update(booking_params)
    end

    private
      def set_booking
        @booking = current_user.bookings.find_by_id(params[:id])
      end

      def booking_params
        params.require(:booking).permit(:start_time, :address_id, :mission_id, :status)
      end
  end
end
