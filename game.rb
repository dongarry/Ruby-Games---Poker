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
		
		@deck.hands.sort!{|h1,h2| h2.score<=>h1.score}
		
		if @deck.hands[0].score==0
			get_highest_card @deck.hands
		else
			curr_score = @deck.hands[0].score

			@deck.hands.each do |c| 
				if c.score < curr_score 
					break
				end
				contenders << c
			end			
		end

		if contenders.length>1 
			puts "multiple contenders"
			get_highest_card contenders		
		elsif contenders.length==1
			puts "Winner : #{@deck.hands[0].hand.join(' ')}"
		end
	end
	
	def get_highest_card hands
		
		contenders=[]

		5.times do |i|
			hands.sort!{|h1,h2| h2.highest_cards[i]<=> h1.highest_cards[i]}			
			h_c = hands[0].highest_cards[i]	
			#contenders<<@deck.hands[i].higest_cards[i]
				
			hands.each do |h| 
				if h.highest_cards[0]==h_c
					contenders<<h
				end
			end		
			
			if contenders.length == 1
				puts "Winning hand with highest card : #{h_c} : #{contenders[0].hand.join(' ')}"	
				break
			end
		end

		if contenders.length>1
			puts "DRAW! between :"
			contenders.each {|c| puts c.hand.join('')}
		end			

	end		

end

game = Game.new 
#game.play_game 
#game.play_game ['H2','C3','D12','H13','H14'], ['S2','H3','H4','C13','D14']
game.play_game ['H6','S4','D2','C2','S13'], ['H5','C3','D3','S9','S5']
puts game.deck.hands[1].hand		

