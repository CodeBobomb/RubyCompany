require_relative './employee'


class Tester < Employee

	def initialize(first, last_name, id)
		super(first, last_name, id)
	end

	def write_tests(number_of_tests, type_of_test="automatic")
		return rand(number_of_tests/2) if type_of_test=="manual"
		rand(number_of_tests) 
	end
	

	def calculate_pay(working_at=nil)
		super + working_at.member_of_teams*@wage*0.4
	end
end
