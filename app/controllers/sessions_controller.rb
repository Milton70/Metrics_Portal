class SessionsController < ApplicationController

	def index
		# This may not work in our NT environment if so need to do the following:
		#In your rails application, add Rekado's gem to your Gemfile: gem 'ntlm-sso', '=0.0.1'
		#Create an initialiser config/initializers/ntlm-sso.rb with:
		#require 'rack'
		#require 'rack/auth/ntlm-sso'
		#
		#class NTLMAuthentication
  	#	def initialize(app)
    # 	@app = app
  	# end
  	#
  	# def call(env)
    #  auth = Rack::Auth::NTLMSSO.new(@app)
    #  return auth.call(env)
  	# end
		#end
		#On your application.rb file, add the line: config.middleware.use "NTLMAuthentication"
		#
		#Call request.env["REMOTE_USER"] on your view or controller to get current username.
		
		require 'etc'
		@current_user = Etc.getlogin
		legal_user = User.find_by(user_id: @current_user)
		if legal_user
			session[:user_name] = legal_user.user_name
			session[:is_admin] = legal_user.user_roles[0].role_id
			render 'index'
		else
			reset_session
			@mail_user = 'stewartf@erbd.com'
			render 'invalid_login'
		end
	end

end
