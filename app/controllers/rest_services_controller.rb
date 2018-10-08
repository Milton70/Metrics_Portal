class RestServicesController < ApplicationController

	def index
		@json_response = "{ this is where some json data will be displayed }"
	end

	def show
		@json_response = RestService.get_all_employees
		render 'index'		
	end

	def get_an_employee
		@json_response = RestService.get_an_employee(params[:id])
		render 'index'
	end

	def edit
		@json_response = RestService.update_an_employee(params[:id], params[:name], params[:salary], params[:age])
		render 'index'
	end

	def destroy
		@json_response = RestService.delete_an_employee(params[:id])
		render 'index'
	end

	def new
		@json_response = RestService.create_an_employee(params[:id])
		render 'index'
	end
end
