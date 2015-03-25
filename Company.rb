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


	def getName
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

		@projects.delete(name)
	end

	def listProjects
		puts "Currently active projects: "
		@projects.each do |project|
			puts "Project #{project}"
		end
	end 


	def assignTeam(project, team_name)
		@teams[Team.new(team_name)]=project
		puts @teams.size
	end

	def listTeams
		@teams.each do |team, project|
			puts "\"#{team.getName}\" on project:\"#{project}\" "
		end
	end

	def getTeam(team_name)
		tim=@teams.select do |team, project|
			team.getName==team_name
		end

		tim.keys[0]

	end

	def Teams(project_name)
		selected=@teams.select do |team, project|
					project==project_name
					end
		selected.keys
	end



end
