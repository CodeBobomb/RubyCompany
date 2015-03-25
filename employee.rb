class Employee
	@@num=0
private

public
	attr_accessor :first_name
	attr_accessor :last_name
	attr_reader :id

	def initialize(first, last, id=0)
		@first_name=first
		@last_name=last
		id==0 ? @id=@@num : @id=id 
		@@num+=1;
		@wage=nil
		@days=nil
		@worktime=nil
	end

	def hourly_wage(wage)
		@wage=wage
	end

	def working_day(days)
		@days=days
	end

	def worktime(hours)
		@worktime=hours
	end

	def calculate_pay
		@wage*@days.length*@worktime
	end

end

