require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu
private


	def write_man_menu
		puts "\n\nManager ( #{@emp.first_name} #{@emp.last_name} id: #{@emp.id} ) enter one of the commands: "
		puts "\"Create sprints\" - if you want to create sprints "
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_man_comm(command)
	end


	def execute_man_comm(command)
		case command
		when "create sprints"
			print "Enter the name of the team for which you are creating sprints: "
			team_name=gets.chomp
			puts "You have created #{@emp.create_sprints(@company.find_team_by_name(team_name))} sprints for team: \"#{team_name}\""
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		else
			@emp=nil
			return
		end
		write_man_menu
	end



public

	def manager_menu(manager)
		@emp=manager
		write_man_menu
		
	end
	
end