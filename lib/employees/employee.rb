
class Employee

public
	attr_accessor :first_name
	attr_accessor :last_name
	attr_reader :wage
	attr_reader :days
	attr_reader :worktime
	attr_reader :id

	def initialize(first, last, id=0)
		@first_name=first
		@last_name=last
		@id=id
		@wage=0
		@days=0
		@worktime=0
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

	def calculate_pay(working_at=nil)
		@wage*@days*@worktime
	end

	def get_number_of_assigned_projects(assambled_teams=nil)
		return 0 if assambled_teams.nil?
		member_of=assambled_teams.select { |team| team.has_member?(@id) }
		member_of.length
	end

end

