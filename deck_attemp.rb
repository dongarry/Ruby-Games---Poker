class Deck

  #attr_accessor current_score,hand

  def initialize
    @suit = ['C','D','H','S']
    @card = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
    @current_score
    @hand=[]
  end

  def deal_hand_1
     return ["2H","JS","6D","2C","KH"]
  end

  def deal_hand_2
     return ["4C","9S","2D","JC","QD"]
  end



end


class Game

  def initialize
    @my_deck = Deck.new

  end

  def get_card
     d_1 = @my_deck.deal_hand_1
     d_2 = @my_deck.deal_hand_2
     give_score d_1
  end

  def convert_card! x

        case x
          when "T"
            x=10
          when "J"
            x=11
          when "Q"
            x=12
          when "K"
            x=13
          when "A"
            x=14
        end
      return x
  end

  def give_score d_1
    temp=0
    count=0
    split_hand=[]
    score=[]
    winning_card=""

    5.times do |x|
       split_hand << d_1[x].split(//)
       card=d_1[x].split(//).first
        #puts split_hand

       #puts card


        if card.instance_of?(String)
          card = convert_card! card
        end

        score<<card

        #puts "#{card} appears #{score.select{|x| x==card}.size} times!"

        if count<score.select{|x| x==card}.size
            count=score.select{|x| x==card}.size
            winning_card=card
        end
    end

    puts "#{winning_card} appears #{count} times"

 end

end


poker_game=Game.new
poker_game.get_card
