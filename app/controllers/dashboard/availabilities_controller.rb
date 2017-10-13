module Dashboard
  class AvailabilitiesController < DashboardController
    def index

      puts '**************'
      puts '**************'
      puts '**************'
      puts '**************'
      puts '**************'
      puts availability
      render json: ['19:00', '19:30']
    end
  end
end
