require './Employee'
require './Developer'
require './Manager'
require './Accountant'

class Team

	def initialize(name)
		@name=name
		@manager=nil
		@developers=[]
	end

	def assignManager(manager)
		@manager=manager;
	end

	def addDeveloper(developer)
		@developers << developer
	end

	def getDevelopers
		@developers
	end

	def getManager
		@manager
	end


	def name
		@name
	end


end

class Company

	def initialize(name)
		@name=name
		@employees = []
		@projects = []
		@teams = {}
	end

	def addProject(name)
		@projects << name
	end

	def removeProject(name)
		@teams.delete_if do |team,project|
			project==name
		end

		projects.remove(name)

	end

	end

	def assignTeam(project, team_name)
		@teams[Team.new(team_name)]=project
	end

	def Team(team_name)
		@teams.select do |team,project| 
			team.name=team_name
		end
	end


end
