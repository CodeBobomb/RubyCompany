
class Employee

public
	attr_accessor :first_name
	attr_accessor :last_name
	attr_accessor :wage
	attr_accessor :workdays
	attr_accessor :worktime
	attr_reader :id

	def initialize(first, last, id=0)
		@first_name=first
		@last_name=last
		@id=id
		@wage=0
		@workdays=0
		@worktime=0
	end



	def hourly_wage(wage)
		@wage=wage
	end

	def working_day(days)
		@workdays=days
	end

	def worktime(hours)
		@worktime=hours
	end

	def calculate_pay(working_at=nil)
		@wage*@workdays*@worktime
	end
end

