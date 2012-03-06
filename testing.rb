
class TestMe

	def initialize 
		@hello = "this is a test"
	end
	
	def hello
		puts @hello
	end
	
	def prs *args
		4.times do |i|
			begin
				t_#{i} = args[i]
				puts t_#{i}
			rescue
				puts "Issue assigning variables.."
			end
		end
		#args.each {|a| puts a}
		puts t_2
	end
end

m=TestMe.new
m.prs 22,23,24
