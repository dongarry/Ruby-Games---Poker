class Deck
	attr_reader :hand,:suit,:card
	
	def initialize
		@suit = ["H","D","C","S"]
		#@card = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
		@card = [2,3,4,5,6,7,8,9,10,11,12,13,14]
		@hand = []
	end
	
	def deal
		@hand = [] # clear-out
		5.times do
			#puts @suit[rand(@suit.length)]			
			@hand << @suit[rand(@suit.length)] + @card[rand(@card.length)].to_s  
		end
		@hand
	end
end

module Card_funcs
	
	def split_hand hand
		hand.each do |i| 
			@me = i.split(//)
			if @deck.suit.include?(@me[0])
				@suit_hand<<@me[0]
				@me.delete(@me[0])
			end
			@card_hand <<@me.to_s.to_i
		end	
	end
	
	def score_order result
		#Case uses the === method - can overwrite this if required.
		case result
			when [1,2]
				puts "A pair or 2 pair"
			when [1,3]
				puts "Three of a kind"
			when [1,4]
				puts "Poker"
			when [2,3]
				puts "Full house"
			else
				puts "We don't know"
		end
	end
end

class Game
	include Card_funcs

	def initialize
		@deck = Deck.new
		@score_1 = 0 # bitfield
		@score_2 = 0 # bitfield
	end
	
	def play_game
		@my_hand1 = @deck.deal
		@my_hand2 = @deck.deal
		
		puts "Hand 1 : #{@my_hand1.join(",")}"
		puts "Hand 2 : #{@my_hand2.join(",")}"
		
		@score_1 = score_hand @my_hand1
			
	end	
	
	def score_hand hand
		
		@score = 0
		@suit_hand=[]
		@card_hand=[]
		
		split_hand hand
		
		puts @card_hand
		puts @suit_hand

		# Score
		# 1 - Straight
		# 2 - Flush
		# 4 - A pair 
		# 8 - 2 pair 
		# 16 - match 3
		# 32 - poker
		# 64 - Full House = 2 pair plus 3 pair ->
				
		if @suit_hand.uniq.length == 1: @score = 1 end
		
		flush=1
		4.times do |c|
			puts c
			if @card_hand[c].to_i+1 != @card_hand[c + 1]
				flush=0
				break 
			end
		end		

		if flush == 1: @score += 2 end
		
		order = @card_hand.inject(Hash.new(0)) {|h,v| h[v] +=1; h}
		
		# Provides all occurances..	
		
		unless order.sort_by{|k,v| v}.last[1]>1
			return
		end
		
		
                puts "Result : #{order.values.uniq.sort}"
		
		puts Hash[order.sort]
		puts order.sort_by{|k,v| v}.last[1]
		
		score_order order.values.uniq.sort
		
	end
end

game = Game.new
game.play_game
