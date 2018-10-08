module RestService
	require 'rest-client'
		
	def self.get_all_employees
		url				= 'http://dummy.restapiexample.com/api/v1/'
		endpoint 	= 'employees' 
		response 	= RestClient.get url + endpoint
		if response.code != 200
			return "there was an error #{response.code}...oops".to_json
		else
			return response.body
		end
	end

	def self.get_an_employee(*args)
		url				= 'http://dummy.restapiexample.com/api/v1/'
		endpoint 	= 'employee' 
		# Get the employee number to retrieve
		response 	= RestClient.get url + endpoint + '/' + args[0].to_s
		if response.code != 200
			return "there was an error #{response.code}...oops".to_json
		else
			return response.body
		end
	end

	def self.create_an_employee(*args)
		url 			= 'http://dummy.restapiexample.com/api/v1/'
		endpoint 	= 'create'
		payload 	= { name: args[0], salary: args[1], age: args[2] }.to_json
		response 	= RestClient.post(url + endpoint,	payload)
		if response.code != 200
			return "there was an error #{response.code}...oops".to_json
		else
			return response.body
		end
	end
	
 	def self.update_an_employee(*args)
		url 			= 'http://dummy.restapiexample.com/api/v1/'
		endpoint 	= 'update'
		payload 	= { name: args[1], salary: args[2], age: args[3]}.to_json
		response 	= RestClient.put(url + endpoint + '/' + args[0].to_s,	payload)
		if response.code != 200
			return "there was an error #{response.code}...oops".to_json
		else
			return response.body
		end
	end

	def self.delete_an_employee(*args)
		url 			= 'http://dummy.restapiexample.com/api/v1/'
		endpoint 	= 'delete'
		response 	= RestClient.delete(url + endpoint + '/' + args[0].to_s)
		if response.code != 200
			return "there was an error #{response.code}...oops".to_json
		else
			return response.body
		end
	end
	
end