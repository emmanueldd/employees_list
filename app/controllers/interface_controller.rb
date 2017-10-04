class InterfaceController < ApplicationController
	before_action :authenticate_pro!
end
