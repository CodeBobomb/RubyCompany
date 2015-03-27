require_relative './employee'


class Tester < Employee

	def initialize(first, last_name, id)
		super(first, last_name, id)
		@testing=Hash.new(0)
		@tests=Hash.new(0)
	end

	def write_test(project)

	end
	
	def test_project(project)
	 	@testing[project]+=1
	end

	def report_project(project)
		@testing[project]>=5
	def

	def calculate_pay
		super + 
	end
end
