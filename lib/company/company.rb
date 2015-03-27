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

	def add_project(name)
		@projects << name
	end


	def remove_project(name)
		@teams.delete_if do |team,project|
			project==name
		end

		@projects.delete(name)
	end

	def list_projects
		puts "Currently active projects: "
		@projects.each do |project|
			puts "Project #{project}"
		end
	end 


	def assign_team(project, team_name)
		@teams[Team.new(team_name)]=project
		puts @teams.size
	end

	def list_teams
		@teams.each do |team, project|
			puts "\"#{team.name}\" on project:\"#{project}\" "
		end
	end

	def find_team(team_name)
		found=@teams.select { |team, project| team.name==team_name }

		found.keys[0]
	end

	def add_employee(employee)
		employees << employee
	end

	def add_to_team(team_name, id)
		team = find_team(team_name)
		employee=employees.bsearch do |emp| emp.id==id end
		team.add_developer(emp)
	end

	def select_teams(project_name)
		selected=@teams.select do |team, project|
					project==project_name
					end
		selected.keys
	end
end
