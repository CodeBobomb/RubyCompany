require_relative './employee'

class Manager < Employee

	attr_reader :projects

	def initialize(first, last, id=0)
		super(first,last,id)
		@sprints=0
	end

	def create_sprints(team)
		size=team.number_of_members	
		sprints=size%10
		sprints=10 unless sprints!=0
# What is the purpose of this method if we only care about instance variable @sprints and it is always incremented by one?
		@sprints+=1
		sprints 
	end

# What is the purpose of working_at parameter? Where is number_of_assigned_projects?
# Why dont use same logic from developer but only increase/decrease 0.5 to something else?
	def calculate_pay(working_at=nil)
		super + @wage*0.5*(number_of_assigned_projects+@sprints)
	end
end