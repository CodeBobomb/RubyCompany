require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu

private

	
	def write_dev_menu
		puts "\n\nDeveloper ( #{emp.first_name} #{emp.last_name} id: #{emp.id} ) enter one of the commands: "
		puts "\"Add language\" - if you want to add a programming language to your skills "
		puts "\"List languages\" if you want to list programming languages in your skills"
		puts "\"Write code \" - write some code"
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_dev_comm(command)
	end

	def execute_dev_comm(command)
		case command
		when "add langauge"
			print "Enter the name of the programming language: "
			lang=gets.chomp
			emp.add_language(lang)
			puts "#{lang} added to the known skills"
		when "list languages"
			emp.list_languages
		when "write code"
			print "Enter the amount of code you have to write: "
			amount=gets.chomp
			amount.to_i!
			puts "You have written #{emp.write_code(amount)} lines of code."
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		when "exit"
			return
		else
			write_dev_menu
		end
	end

public

	
	def developer_menu(developer)
		write_dev_menu
	end
	
end