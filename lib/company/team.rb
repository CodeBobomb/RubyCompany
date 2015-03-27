require_relative '../employees/employee.rb'
require_relative '../employees/manager.rb'
require_relative '../employees/accountant.rb'
require_relative '../employees/employee.rb'	

class Team

	attr_reader :developers
	attr_reader :manager
	attr_reader :name

	def initialize(name)
		@name=name
		@manager=nil
		@developers=[]
	end

	def assign_manager(manager)
		@manager=manager;
	end

	def add_developer(developer)
		@developers << developer
	end
end