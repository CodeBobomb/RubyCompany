require_relative "../../lib/company/company_creator"



describe "configuring emplyoee atrributes " do
	context "entering valid salary data " do
        before :all do
        	@emp=Employee.new("John","Doe",1)
        end 

		it "sets hourly wage to 20 " do
			@emp.wage=20
			expect(@emp.wage).to eql(20)
		end

		it "sets workdays to 5" do
			@emp.workdays=5
			expect(@emp.workdays).to eql(5)
		end

		it "sets worktime to 8" do
			@emp.worktime=8
			expect(@emp.worktime).to eql(8)
		end
	end
	
	context "entering invalid salary data " do
		before :all do
			@emp=Employee.new("John","Doe",1)
		end

		it "tries setting wage to -1 " do
			expect(@emp.wage=-1).to raise_error
		end

		it "tries setting workdays to -1 " do
			expect(@emp.workdays=-1).to raise_error
		end

		it "tries setting worktime to -1  " do
			expect(@emp.worktime=-1).to raise_error
		end
	end
end

