require './employee'
require './developer'
require './manager'
require './accountant'

class Team

	attr_reader :developers
	attr_reader :manager
	attr_reader :name

	def initialize(name)
		@name=name
		@manager=nil
		@developers=[]
	end

	def assign_manager(manager)
		@manager=manager;
	end

	def add_developer(developer)
		@developers << developer
	end
end

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
		tim=@teams.select do |team, project|
			team.name==team_name
		end

		tim.keys[0]
	end

	def select_teams(project_name)
		selected=@teams.select do |team, project|
					project==project_name
					end
		selected.keys
	end
end
