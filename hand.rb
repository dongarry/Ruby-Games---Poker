require 'deck'
require 'card_funcs'

class Hand

	include Card_funcs
	
	attr_reader :score, :highest_cards, :hand
	
	def initialize dealt_hand, deck 
		@score = 0 		
		@highest_cards = []
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
		
		@highest_cards = @card_hand.sort.reverse
		
		
		# Scoring
		# 0 - High card - no matches
		# 1 - A pair
		# 2 - 2 pair 
		# 4 - Match 3
		# 8 - Flush
		# 16 - Straight
		# 32 - Full House = 10? 
		# 64 - Poker Four matching
		# 128 - Straight Flush - 24?  
		
		# Put all scoring in the same place!!
		if @suit_hand.uniq.length == 1 
			@score += 8 
			puts "Flush!" 
		end
		
		straight=1
		pass=0
		
		4.times do |c|
			
			if @card_hand[c] +1 == @card_hand[c + 1]
				next
			elsif @card_hand.include?(@my_deck.card.first) && @card_hand.include?(@my_deck.card.last) && pass==0
				pass=1
				next
			end
			
			#Not a straight
			straight=0
			break 
		end		
		
		#should we simply return - can't get better! 
		if straight == 1 
			if @score & 8 > 0  then
				puts "Straight Flush!"
				@score=128
			else
				puts "Straight!"
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
