require_relative './employee'

class Developer < Employee

	attr_reader :languages

	def initialize(first, last, languages, id=0)
		super(first,last,id)
		@languages=languages
	end

	def list_languages
		print "I know the following programming languages: "
		@languages.each { |language| print language + " " }
		print "\n"
	end

	def add_language(language)
		@languages << language
	end

	def write_code(lamount_of_code)
		rand(amount_of_code) 
	end


	def calculate_pay(working_at=nil)
		super + @wage*0.3*@languages.length + @wage*0.1*get_number_of_assign_projects(working_at.teams)
	end

end
