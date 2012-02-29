require 'game'
require 'test/unit'

class TestGame < Test::Unit::TestCase
	
	def setup
		@game = Game.new
	end
	
	def test_hand
		@game.play_game
		assert_equal(@game.deck.hands[0].length, 5)
		assert_equal(@game.deck.hands[1].length, 5)
	end
	
	def test_score_2
		@game.play_game ['H6','S4','D2','C2','S13'], ['H5','C3','D3','S9','S5']
		assert_equal(@game.deck.hands[0].score, 1) #a Pair
		assert_equal(@game.deck.hands[1].score, 2) #2 pair
		
	end
	
	def test_score_3
		@game.play_game ['H2','S2','D2','C2','S13'], ['H5','C3','D3','S3','H14']
		assert_equal(@game.deck.hands[0].score, 64) #Poker
		assert_equal(@game.deck.hands[1].score, 4) #3 of a kind
	end
	
	def test_score_4 
		@game.play_game ['H2','S3','D4','C5','S6'], ['H5','H3','H10','H7','H12']
		assert_equal(@game.deck.hands[0].score, 16) #Flush
		assert_equal(@game.deck.hands[1].score, 8) #Straight
	end
	
	def test_score_5 
		@game.play_game ['H8','S5','D5','C5','S8'], ['H5','H6','H7','H9','H8']
		assert_equal(@game.deck.hands[0].score, 32) #Full House
		assert_equal(@game.deck.hands[1].score, 128) #Straight Flush
	end
end