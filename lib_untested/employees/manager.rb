require_relative './employee'

class Manager < Employee

	attr_reader :projects
	attr_reader :completed_stories

	def initialize(first, last, id=0)
		super(first,last,id)
		@completed_stories=0
		@stories_required=0
	end

	def set_number_of_stories(number_of_stories)
		@stories_required=number_of_stories
	end

	def completed_stories=(number_of_stories)
		@completed_stories+=number_of_stories
		@stories_required-=number_of_stories
	end

	def calculate_pay(working_at=nil)
		super + @wage*0.5*(working_at.member_of_teams+@stories_created)
	end
end