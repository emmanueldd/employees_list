class ProsController < ApplicationController
  before_action :set_pro, only: [:show]

  def index
    # Retourner les pros dont les horaires couvrent tel weekday et tel date
    @pros = Pro.all
    if params[:date].present?
      @wday = params[:date].to_date.wday
      @pros = Pro.joins(:business_hours).where(business_hours: {week_day: @wday, open: true})
    end
  end

  def show
  end

  private
    def set_pro
      @pro = Pro.find(params[:id])
    end
end
