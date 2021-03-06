require_relative './employee'

class Developer < Employee

	attr_reader :languages
	attr_reader :tasks_competed

	def initialize(first, last, id=0)
		super(first,last,id)
		@languages=[]
		@tasks_competed=0;
		@number_of_tasks=0
	end

	def list_languages
		print "I know the following programming languages: "
		@languages.each { |language| print language + " " }
		print "\n"
	end

	def add_language(language)
		raise ArgumentError, "Provided object is not a string" if language.class.name!="String"
		raise ArgumentError, "Language is already in the list" if !(find_language(language).nil?)
		@languages << language
	end

	def complete_tasks(number_of_tasks)
		raise ArgumentError,"Number of tasks must be a positive nonzero number" if number_of_tasks<1
			@tasks_competed+=number_of_tasks
		number_of_tasks 
	end

	def find_language(language)
		@languages.select { |lang| lang==language }[0]
	end


	def calculate_pay(working_at=nil)
		super + @wage*0.3*@languages.length + @wage*0.1*working_at.member_of_teams(@id).length + @wage*0.1*@tasks_competed
	end

end
