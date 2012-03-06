require 'deck'

class Game
	include Card_funcs
	
	attr_reader :deck
	
	def initialize no_players=2
		@deck = Deck.new
		@no_of_players = no_players
	end
	
	def play_game  *test_hands 
			
		@no_of_players.times do |h|
			@deck.deal(test_hands[h].nil? ? [] : test_hands[h])
		end
			
		if @deck.check_deal 
			score_game 		
		else
			puts "Bad deal!"
		end
	end	
	
	def score_game contenders=[]
		
		@deck.hands.sort!{|h1,h2| h1.score<=> h2.score}
		
		if @deck.hands[0].score==0
			get_highest_card @deck.hands
		else
			contenders << @deck.hands[0]

			@deck.hands.each do |c| 
				unless c.score == @deck.hands[0].score 
					break
				end
				contenders << c
			end			
		end

		if contenders.length>1 
			get_highest_card contenders		
		else
			puts "Winner : #{@deck.hands[0].hand}"
		end
	end
	
	def get_highest_card hands
		contenders=[]


#		hands.sort!{|h1,h2| h1.highest_cards[0]<=> h2.highest_cards[0]}			
			#contenders<<@deck.hands[0].higest_cards[0]
		hands.each {|h| puts h.highest_cards[0]}

	end		

end

game = Game.new
game.play_game 
#game.play_game ['H2','C3','D12','H13','H14'], ['S2','H3','H4','C13','D14']


