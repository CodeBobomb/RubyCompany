require_relative './employee'

class Manager < Employee

	attr_reader :projects
	attr_reader :completed_stories
	attr_reader :stories_required

	def initialize(first, last, id=0)
		super(first,last,id)
		@completed_stories=0
		@stories_required=0
	end

	def set_number_of_stories(number_of_stories)
		raise ArgumentError, "Number of stories must be a positive number" if number_of_stories<1
		@stories_required=number_of_stories
	end

	def completed_stories=(number_of_stories)
		raise ArgumentError, "Number of stories must be a positive number" if number_of_stories<1
		raise ArgumentError, "Value must be smaller than required number of stories" if number_of_stories>stories_required
		@completed_stories+=number_of_stories
		@stories_required-=number_of_stories
	end

	def calculate_pay(working_at=nil)
		super + @wage*0.5*(working_at.member_of_teams(id).length+@completed_stories)
	end
end