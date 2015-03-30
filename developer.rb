require './employee'

class Developer < Employee

	attr_reader :languages
	attr_reader :projects

	def initialize(first, last, languages, id=0)
		super(first,last,id)
		@languages=languages
	end

	def list_languages
		print "I know the following programming languages: "
		@languages.each do |language|
			print language + " "
		end
		print "\n"
	end

	def add_language(language)
		@languages << language
	end

	def get_number_of_assigned_projects(developer_name, assembled_teams)
		@projects = assembled_teams.select { |project, name| name.developers.include? developer_name }.length
	end

	def calculate_pay
		super + @wage*0.3*@projects
	end
end
