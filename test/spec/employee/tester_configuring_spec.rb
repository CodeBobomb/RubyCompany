require_relative "../../helpers/company_creator"

describe "Configuring tester" do

	before :each do
		@tester = Tester.new("John","Toe",1)
	end

	context "Write 10 automatic tests" do
		it "automatic tests written" do
			@tester.write_tests(10,"automatic")
			expect(@tester.automatic).to eql(10)
		end
	end

	context "Write 10 manual tests" do
		it "manual tests written" do
			@tester.write_tests(10,"manual")
			expect(@tester.manual).to eql(10)
		end
	end

	context "Read number of written tests" do
		before do
			@tester.write_tests(10,"automatic")
			@tester.write_tests(10,"manual")
		end
		it "recieved number of tests" do
			expect(@tester.tests_written).to eql(20)
		end
	end

	context "Write -1 automatic tests" do
		it "writing automatic tests failed" do
			expect{ @tester.write_tests(-1,"automatic")}.to raise_error
		end
	end

	context "Write -1 manual tests" do
		it "writing manual tests failed" do
			expect{ @tester.write_tests(-1,"manual") }.to raise_error
		end
	end
end