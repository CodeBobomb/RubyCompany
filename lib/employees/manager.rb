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
		@sprints+=1
		sprints 
	end



	def calculate_pay(working_at=nil)
		super + @wage*0.5*(number_of_assigned_projects+@sprints)
	end
end