require 'deck'
require 'test/unit'

class TestDeck < Test::Unit::TestCase
	
	def setup
		@deck = Deck.new
	end
	
	def test_deck
		assert_equal(@deck.suit.length,4)
		assert_equal(@deck.card.length,13)
	end
	
end