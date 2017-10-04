module Interface
  class BusinessHoursController < InterfaceController
    def create
      @business_hour = current_pro.business_hours.new(business_hour_params)
      redirect_back(fallback_location: root_path) if @business_hour.save!
    end

    private
    def business_hour_params
      params.require(:business_hour).permit(:start_time, :end_time, :date, :open)
    end
  end
end
