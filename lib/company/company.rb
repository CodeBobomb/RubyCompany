require_relative './team'



class Company

	attr_reader :name
	attr_reader :employees
	attr_reader :projects
	attr_reader :teams

	def initialize(name)
		@name=name
		@employees = []
		@projects = []
		@teams = {}
	end

	def add_project(project_name)
		@projects << project_name
	end


	def list_projects
		puts "Currently active projects: "
		@projects.each { |project| puts "Project: #{project}" }
	end 	


	def remove_project(project_name)
		@teams.delete_if { |team,project| project==name }

		@projects.delete_if { |project| project==name }
	end

	def assign_team_to_project(project_name, team)
		@teams[project_name.to_sym]=team
	end

	def list_teams
		@teams.each { |project, team| puts "Team: \"#{team.name}\" is working on project: \"#{project.to_s}\" "}
	end

	def find_team(team_name)
		team=@teams.select { |project, project_team| project_team.name==team_name }
		team.values[0] unless team.nil?
	end

	def add_employee(employee)
		employees << employee
	end

	def assign_to_team(team_name, employee_id)
		team = find_team(team_name)
		employee=employees.bsearch { |emp| emp.id==id }
		team.add_member(emp)
	end
end
