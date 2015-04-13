require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu

private

	
	def write_dev_menu
		puts "\n\nDeveloper ( #{@emp.first_name} #{@emp.last_name} id: #{@emp.id} ) enter one of the commands: "
		puts "\"Add language\" - if you want to add a programming language to your skills "
		puts "\"List languages\" if you want to list programming languages in your skills"
		puts "\"Write code \" - write some code"
		puts "\"Calculate pay\" - if you want to see your salary"
		puts "\"Exit\" - if you want to exit the menu"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_dev_comm(command)
	end

	def execute_dev_comm(command)
		case command
		when "add language"
			print "Enter the name of the programming language: "
			lang=gets.chomp
			@emp.add_language(lang)
			puts "#{lang} added to the known skills"
		when "list languages"
			@emp.list_languages
		when "write code"
			print "Enter the amount of code you have to write: "
			amount_s=gets.chomp
			amount=amount_s.to_i
			puts "You have written #{@emp.write_code(amount)} lines of code."
		when "calculate pay"
			print "You are currently earning  #{@emp.calculate_pay(@company)}$ at your comapny."
		else
			@emp=nil
			return
		end

		write_dev_menu
	end

public

	
	def developer_menu(developer)
		@emp=developer
		write_dev_menu
	end
	
end