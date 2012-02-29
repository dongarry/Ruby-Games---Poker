require 'deck'

class Game
	include Card_funcs
	
	attr_reader :deck
	
	def initialize
		@deck = Deck.new
		@score_1 = 0 # bitfield
		@score_2 = 0 # bitfield
	end
	
	def play_game h1=[], h2=[]
		
		#Parameters are for testing purposes.
		
		@my_hand1 = @deck.deal h1
		
		@my_hand2 = @deck.deal h2
			
		puts "Hand 1 : #{@my_hand1.hand.join(",")} : #{@my_hand1.score}"
		puts "Hand 2 : #{@my_hand2.hand.join(",")} #{@my_hand2.score}"
		
		score_game @my_hand1,@my_hand2
			
	end	
	
	def score_game h1, h2
		
		if h1.score>h2.score
			puts "Hand 1 wins!"
		elsif h2.score>h1.score
			puts "Hand 2 wins!"
		end
	end
	
	
end

game = Game.new
#game.play_game
game.play_game ['H2','S3','D4','C5','S6'], ['H5','H6','H7','H9','H8']

puts game.deck.hands[0].hand.length

game.deck.hands.each do |h|
	puts h.score
end

