require_relative './team'



class Company

	attr_reader :company_name
	attr_reader :employees
	attr_reader :teams

	def initialize(company_name)
		@company_name=company_name
		@employees = []
		@teams = []
	end


	def add_team_and_project(team)
		@teams << team
	end

	def list_projects
		puts "Currently active projects: "	
		@projects.each { |project| puts "Project: #{project}" }
	end 	

	def remove_finished_projects
		@teams.delete_if { |team| team.goal_reached? }

	end

	def remove_project(project_name)
		@teams.delete_if { |team| team.project_name==project_name }
	end

	def list_teams
		@teams.each { |team| puts "#{team.team_name} is working on project: \"#{team.project_name}\" "}
	end

	def find_team_by_project(project_name)
		@teams.bsearch { |project_team| project_team.project=project_name }
	end

	def find_employee(employee_id)
		@employees.bsearch { |emp| emp.id==employee_id }
	end

	def add_employee(employee)
		employees << employee
	end

	def assign_to_project(project_name, employee_id)
		team = find_team_by_project(project_name)
		employee=employees.bsearch { |emp| emp.id==id }
		team.add_member(emp)
	end
end
