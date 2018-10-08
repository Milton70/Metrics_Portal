class RestServicesController < ApplicationController

	def index
		@json_response = "{ this is where some json data will be displayed }"
	end

	def new
		@json_response = RestService.get_all_employees
		render 'index'		
	end

	def edit
		@json_response = RestService.get_an_employee(params[:id])
		render 'index'
	end

end
