require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu
private
	
	def write_tester_menu
		puts "\n\nTester ( #{emp.first_name} #{emp.last_name} id: #{emp.id} ) enter one of the commands: "
		puts "\"Write test\" - write some tests. "
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_tester_comm(command)

	end


	def execute_tester_comm(command)
		case command
		when "write test"
			print "\nWhat kind of tests are you writing (automatic or manual): "
			type = gets.chomp
			type.downcase!
			print "How many tests are you writing:  "
			amount = gets.chomp
			amount.to_i!
			puts "You have managed to write #{emp.write_tests(amount,type)} tests "
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		when "exit"
			return
		else
			write_tester_menu
		end
	end

public
	
	
	def tester_menu(tester)
		write_man_menu
	end
	
end