require 'hand'

class Deck
	attr_reader :hands,:suit,:card, :game_deck
	
	def initialize
		@suit = ["H","D","C","S"]
		#@card = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
		@card = [2,3,4,5,6,7,8,9,10,11,12,13,14]
		@game_deck = make_deck
		@hands=[]
	end
	
	def make_deck
		d=[]
		@suit.each do |s|
			@card.each do |c|
				d << s + c.to_s
			end
		end
		d.shuffle
	end
	
	def deal h = []
		
		#puts @game_deck.join(",")
		if h.empty? 
			5.times do
				h << @game_deck.shift # Pop -> underhand deal? 
			end
		end
		
		puts "Deal : #{h.join(",")}"
		
		@hand=Hand.new(h,self)
		@hands<<@hand
		@hand
	end
	
	def check_deal
	
		all_hands=[]
		
		@hands.each do |h| 
			h.hand.each {|c| all_hands<<c}
		end
		#puts "#{all_hands.uniq.length} vs 5 * #{hands.length}"
		return all_hands.uniq.length == (5*@hands.length)
	end
end

