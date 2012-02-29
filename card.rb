class Deck
	def initialize
		@suit = ["H","D","C","S"]
		@card = [2,3,4,5,6,7,8,9,10,11,12,13,14]
	end
	
	def check
		puts "We're up and running!"
	end
end

myDeck = Deck.new
myDeck.check