require_relative './employee'

class Manager < Employee

	attr_reader :projects

	def initialize(first, last, id=0)
		super(first,last,id)
		@stories_created=0
	end

	def create_stories(team)
		size=team.number_of_members	
		stories=size%10
		stories=10 unless stories!=0
		@stories_created+=1
		stories 
	end



	def calculate_pay(working_at=nil)
		super + @wage*0.5*(working_at.member_of_teams+@stories_created)
	end
end