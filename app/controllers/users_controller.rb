class UsersController < ApplicationController
	
	def index
		if session[:is_admin] == 1
			@users = User.all
		else
			redirect_to '/'
		end
	end

	def new
		if session[:is_admin] == 1
			@user 	= User.new
			@roles	= Role.all
		else
			redirect_to '/'
		end
	end

	def create		
		if session[:is_admin] == 1
			@user = User.new(user_params)
			@user.user_id = params['user']['user_id']
			@user.user_name = params['user']['user_name']
			@user.user_email = params['user']['user_email']
			if @user.save
				@user.user_roles.create(role_id: params['role'].to_i)
				flash[:success] = "User [ #{@user.user_name} ] created."
				redirect_to '/users'
			else
				render 'new'
			end
		else
			redirect_to '/'
		end
	end

	def edit
		if session[:is_admin] == 1
			@user = User.find(params[:id])
		else
			redirect_to '/'
		end
	end

	def update
		if session[:is_admin] == 1
			@user = User.find(params[:id])
			if @user.update user_id: params['user']['user_id'], user_name: params['user']['user_name'], user_email: params['user']['user_email']	
				#assignment_id = @user.user_roles.pluck(:id)[0].to_i		
				#@user.user_roles.update(assignment_id, role_id: params['role'].to_i)
				flash[:success] = "User [ #{@user.user_name} ] updated."
				redirect_to '/users'
			else
				render 'edit'
			end
		else
			redirect_to '/'
		end
	end

	def destroy
		if session[:is_admin] == 1
			@user = User.find(params[:id])
			@user.destroy
			flash[:success] = "User [ #{@user.user_name} ] deleted."
			redirect_to action: :index
		else
			redirect_to '/'
		end
	end

	private

		def user_params
			params.require(:user).permit(:user_id, :user_name, :user_email)
		end

end
