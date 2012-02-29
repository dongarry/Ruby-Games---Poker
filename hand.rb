require 'deck'
require 'card_funcs'

class Hand

	include Card_funcs
	
	attr_reader :score, :highest_card, :hand
	
	def initialize dealt_hand, deck 
		@score = 0 		
		@highest_card = String.new
		@hand = dealt_hand
		@my_deck = deck
		
		unless @hand.empty?: score_hand dealt_hand end
	end
	
	def length
		@hand.length
	end
	
	def score_hand hand
		
		@suit_hand=[]
		@card_hand=[]
		
		split_hand hand
		
		#Take the highest card for reference.
		
		@highest_card = @card_hand.sort.last
		
		
		# Scoring
		# 0 - High card - no matches
		# 1 - A pair
		# 2 - 2 pair 
		# 4 - Match 3
		# 8 - Straight
		# 16 - Flush
		# 32 - Full House = 2 pair plus 3 pair - 10? 
		# 64 - Poker Four matching
		# 128 - Straight Flush - 24?  
		
		# Put all scoring in the same place!!
		if @suit_hand.uniq.length == 1 
			@score += 8 
			puts "Straight!" 
		end
		
		flush=1
		4.times do |c|
			if @card_hand[c].to_i+1 != @card_hand[c + 1]
				flush=0
				break 
			end
		end		
		
		#should we simply return - can't get better! 
		if flush == 1 
			if @score & 8 > 0  then
				puts "Straight Flush!"
				@score=128
			else
				puts "Flush!"
				@score+= 16 
			end
			
		end
		
		order = @card_hand.inject(Hash.new(0)) {|h,v| h[v] +=1; h}
		
		# Provides all occurances..	
		
		unless order.sort_by{|k,v| v}.last[1]>1
			return
		end
		
		@score = score_order order.values.sort
	end
end
