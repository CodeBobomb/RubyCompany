class Employee
	@@num=0;
private

public
	
	def initialize(first, last, id=0)
		@first_name=first
		@last_name=last
		id==0 ? @id=@@num : @id=id 
		@@num+=1;
	end

	def getID
		@id
	end

	def getFirstName
		@first_name
	end

	def getLastName
		@last_name
	end

	def setHourlyWage(wage)
		@wage=wage
	end

	def setWorkingDays(days)
		@days=days
	end

	def setWorktime(hours)
		@worktime=hours
	end

	def calculatePay
		@wage*@days.length*@worktime
	end

end

