require "./RubyCompany/Employee"

class ScrumMaster < Employee

	def initialize(first, last, id=0)
		super(first,last,id)
		@projects={}
	end

	def assignProject(name, num)
		@projects[name]=num
	end

end