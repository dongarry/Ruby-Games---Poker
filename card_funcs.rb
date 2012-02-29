module Card_funcs
	
	def split_hand hand
		h_c = 0
		hand.each do |i| 
			@me = i.split(//)
			if @my_deck.suit.include?(@me[0])
				@suit_hand<<@me[0]
				@me.delete(@me[0])
			end
			
			@card_hand <<@me.to_s.to_i
		end	
		@card_hand.sort!
	end
	
	def score_order result
		result.delete(1)
		
		#Case uses the === method - can overwrite this if required.
		case result
			when [2]
				puts "A pair"
				return 1
			when [2,2]
				puts "Two pair"
				return 2
			when [3]
				puts "Three of a kind"
				return 4
			when [4]
				puts "Poker"
				return 64
			when [2,3]
				puts "Full house"
				return 32
			else
				puts "A hustler!!"
		end
	end
end