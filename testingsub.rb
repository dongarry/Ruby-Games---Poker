require 'testing'

class TestSub < TestMe

	def goodbye
		puts "bye"
	end
end

t=TestSub.new
t.goodbye
t.hello