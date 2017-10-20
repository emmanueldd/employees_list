class LeadsController < ApplicationController
  before_action :set_lead, only: [:edit, :update]

  def edit
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      session[:lead_id] = @lead.id
      redirect_to edit_lead_path(@lead)
    end
  end

  def update
    redirect_to root_path if @lead.update(lead_params)
  end

  private
    def set_lead
      @lead = Lead.find_by_id(session[:lead_id])
      redirect_back(fallback_location: root_path) if @lead.nil?
    end

    def lead_params
      params.require(:lead).permit(:email, :first_name, :last_name, :phone, :instagram_url)
    end
end
