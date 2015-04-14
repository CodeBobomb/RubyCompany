
class Employee

public
	attr_reader :first_name
	attr_reader :last_name
	attr_reader :wage
	attr_reader :workdays
	attr_reader :worktime
	attr_reader :id

	def initialize(first, last, id=0)
		@first_name=first
		@last_name=last
		@id=id
		@wage=0
		@workdays=0
		@worktime=0
	end

	def first_name=(fname)
		@first_name=fname
	end

	def last_name=(lname)
		@last_name=lname
	end

	def wage=(wage)
		@wage=wage
	end

	def workdays=(days)
		@workdays=days
	end

	def worktime=(hours)
		@worktime=hours
	end

	def calculate_pay(working_at)
		@wage*@workdays*@worktime
	end
end

