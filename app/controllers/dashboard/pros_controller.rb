module Dashboard
  class ProsController < DashboardController
    def update
     redirect_back(fallback_location: root_path) if  current_pro.update(pro_params)
    end

    private
      def pro_params
        params.require(:pro).permit(:calendar_id, business_hours_attributes: [:start_time, :end_time, :date, :open, :closed, :id])
      end
  end
end
