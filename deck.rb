require 'hand'

class Deck
	attr_reader :hands,:suit,:card
	
	def initialize
		@suit = ["H","D","C","S"]
		#@card = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
		@card = [2,3,4,5,6,7,8,9,10,11,12,13,14]
		@hands=[]
	end
	
	def deal h = []
		
		if h.empty? 
			5.times do
				h << @suit[rand(@suit.length)] + @card[rand(@card.length)].to_s  
			end
		end
		
		@hand=Hand.new(h,self)
		@hands<<@hand
		@hand
	end
end

