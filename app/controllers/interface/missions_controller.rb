module Interface
  class MissionsController < InterfaceController

    def new
      @mission = Mission.new()
      @parent_missions = Mission.parent_missions
    end

    def create
      @mission = current_pro.missions.new(mission_params)
      redirect_back(fallback_location: root_path) if @mission.save
    end

    def index
      @mission = current_pro.missions
    end

    private
      def mission_params
        params.require(:mission).permit(:name, :description, :duration, :price, :parent_id)
      end
  end
end
