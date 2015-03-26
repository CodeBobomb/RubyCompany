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
	attr_accessor :assembled_teams

	def initialize(name)
		@name=name
		@employees = []
		@projects = []
		@assembled_teams = {}
	end

	def add_project(project_name)
		@projects << project_name
	end

	def remove_project(project_name)
		@assembled_teams.tap { |at| at.delete(project_name) } if @assembled_teams.key? project_name
		@projects.delete_if { |project| project == project_name }
	end

	def list_projects
		@projects.each { |project| puts "Project #{project}" }
	end

	def assign_team_to_project(project_name, team)
		@assembled_teams[project_name] = team 
	end

	def list_assembled_teams
		@assembled_teams.each { |project, team| puts "Team #{team.name} works on project #{project}" }
	end

	def find_assembled_team(team_name)
		team = @assembled_teams.select { |project, team| team.name == team_name }
		team.values[0] if !team.nil?
	end
end
