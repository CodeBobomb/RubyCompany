require_relative './employee'


class Tester < Employee
	attr_reader :automatic
	attr_reader :manual
	def initialize(first, last_name, id)
		super(first, last_name, id)
		@automatic=0
		@manual=0
	end

	def write_tests(number_of_tests, type_of_test="automatic")
		if type_of_test == "automatic"
			@automatic+=number_of_tests
		elsif type_of_test == "manual"
			@manual+=number_of_tests
		end

		number_of_tests
	end
	
	def tests_written
		@automatic + @manual
	end

	def calculate_pay(working_at=nil)
		super + working_at.member_of_teams(id)*@wage*0.4 + 0.2*@automatic + 0.4*@manual
	end
end
