require_relative './employee'

class Manager < Employee

	attr_reader :projects

	def initialize(first, last, id=0)
		super(first,last,id)
		@projects={}
	end

	def assign_project(name, size)
		@projects[name]=size
	end

	def calculate_pay
		super + @wage*0.5*projects.length
	end
end