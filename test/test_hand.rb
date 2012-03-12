require 'game'
require 'test/unit'

# Using testRb to run this : testrb test

class TestGame < Test::Unit::TestCase
	
	def setup
		@game = Game.new
	end
	
	def test_hand
		@game.play_game
		assert_equal(@game.deck.hands[0].length, 5)
		assert_equal(@game.deck.hands[1].length, 5)
	end
	
	def test_higest_card_with_no_matches
		@game.play_game ['H6','S4','D2','C3','S13'], ['H5','C3','D4','S9','S10']
		assert_equal(@game.deck.hands[0].score, 0) 
		assert_equal(@game.deck.hands[1].score, 0)
		assert_equal(@game.deck.hands[0].highest_cards[0], 13)
		assert_equal(@game.deck.hands[1].highest_cards[0], 10)			
	end
	
	def test_pair_and_two_pair
		@game.play_game ['H6','S4','D2','C2','S13'], ['H5','C3','D3','S9','S5']
		assert_equal(@game.deck.hands[1].score, 1) #a Pair
		assert_equal(@game.deck.hands[0].score, 2) #2 pair
		
	end
	
	def test_match_3_and_poker
		@game.play_game ['H2','S2','D2','C2','S13'], ['H5','C3','D3','S3','H14']
		assert_equal(@game.deck.hands[0].score, 64) #Poker
		assert_equal(@game.deck.hands[1].score, 4) #3 of a kind
	end
	
	def test_straight_and_flush
		@game.play_game ['H2','S3','D4','C5','S6'], ['H5','H3','H10','H7','H12']
		assert_equal(@game.deck.hands[0].score, 16) #Straight
		assert_equal(@game.deck.hands[1].score, 8) #Flush
	end
	
	def test_straight_and_fail
		@game.play_game ['H2','S3','D12','C13','S14'], ['H2','C3','H10','H11','H14']
		assert_equal(@game.deck.hands[0].score, 16) #Straight
		assert_equal(@game.deck.hands[1].score, 0) #Nothing
	end
	
	def test_house_and_straight_flush 
		@game.play_game ['H8','S5','D5','C5','S8'], ['H5','H6','H7','H9','H8']
		assert_equal(@game.deck.hands[0].score, 32) #Full House
		assert_equal(@game.deck.hands[1].score, 128) #Straight Flush
	end
end