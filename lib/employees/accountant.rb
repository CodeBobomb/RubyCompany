require_relative './employee'



class Accountant < Employee

	def initialize(first, last_name, id)
		super(first, last_name, id)
	end
	 
end
