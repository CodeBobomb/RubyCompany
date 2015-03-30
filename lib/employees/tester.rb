require_relative './employee'

class Tester < Employee

	def initialize(first, last_name, id)
		super(first, last_name, id)
	end

# Maybe we can remove this method as it does not make much sense
	def write_tests(number_of_tests, type_of_test="automatic")
		return rand(number_of_tests/2) if type_of_test=="manual"
		rand(number_of_tests) 
	end
	
# What is the purpose of working_at parameter? Where is number_of_assigned_projects?
# Why dont use same logic from developer but only increase/decrease 0.5 to something else?
	def calculate_pay(working_at=nil)
		super + number_of_assigned_projects*@wage*0.4
	end
end
