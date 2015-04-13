require_relative "../../helpers/company_creator"

describe "Configuring emplyoee atrributes " do

# Ima li razloga da prije svakog contexta pravis novi Employee objekat?
	before :each do
		@emp=Employee.new("John","Doe",1)
	end

	context "Enter valid salary data (wage:20, workdays:5, worktime: 8) " do
		it "salary data set" do
			@emp.wage=20
			@emp.workdays=5
			@emp.worktime=8
			output_array=[@emp.wage,@emp.workdays,@emp.worktime]
			expect(output_array).to match_array([20,5,8])
		end
	end
	
	context "Enter invalid employee wage:-1" do
		it "wage entering failed" do
			expect(@emp.wage=-1).to raise_error
		end
	end

	context "Enter invalid employee workdays:-1" do
		it "workdays entering failed" do
			expect(@emp.workdays=-1).to raise_error
		end
	end

	context "Enter invalid employee worktime: -1" do
		it "worktime entering failed" do
			expect(@emp.worktime=-1).to raise_error
		end
	end
end

