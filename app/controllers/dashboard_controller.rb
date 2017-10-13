class DashboardController < ApplicationController
	before_action :authenticate_pro!
end
