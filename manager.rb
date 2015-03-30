require './employee'

class Manager < Employee

	attr_reader :projects

	def initialize(first, last, id=0)
		super(first,last,id)
	end

	def get_number_of_assigned_projects(manager_name, assembled_teams)
		@projects = assembled_teams.select { |project, name| manager_name == name.manager }.length
	end

	def calculate_pay
		super + @wage*20*@projects
	end
end