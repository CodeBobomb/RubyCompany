require "./RubyCompany/Employee"
require "./RubyCompany/Developer"
require "./RubyCompany/Manager"
require "./RubyCompany/Accountant"

class Team

	def initialize(project, name)
		@project=project
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

	def

end

class Company

	def initialize(name)
		@name=name
		@employees = []
		@projects = []
	end

	def addProject(name)
		@projects << name
	end

	def assignTeam(project, team)
		@teams[]
	end

	def addMember(team, )
end
