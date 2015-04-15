
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
		raise ArgumentError "Wage must be postive nonzero number" if wage<0
		@wage=wage
	end

	def workdays=(days)
		raise ArgumentError "Workdays must be between 0 and 7" if days<0 || days>7
		@workdays=days
	end
	
	def worktime=(hours)
		raise ArgumentError "Worktime must be between 0 and 24" if hours<0 || hours>24
		@worktime=hours
	end

	def calculate_pay(working_at)
		@wage*@workdays*@worktime
	end
end

