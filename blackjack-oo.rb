require 'pry'
# ***************************************
class Deck
  attr_reader :card_deck
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  def initialize
    build_deck
  end

  def build_deck
    @card_deck = []

    SUITS.each do |suit|
      VALUES.each do |value|
        @card_deck.push(Card.new(suit,value))
      end
    end
    @card_deck.shuffle!
  end

  def pop
    @card_deck.pop
  end
end


# ***************************************
class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def suit
    @suit
  end

  def value
    @value
  end

  def show_card
    @suit + " " + @value
  end

  def face_value
    if ['J', 'Q','K'].include?(@value)
      10
    elsif ['A'].include?(@value) 
      1
    else
      @value.to_i
    end
  end

  def ace?
   face_value == 1 
  end
end


# ***************************************
class Hand

  def initialize(name)
    @cards = []
    @name = name
  end

  def hit(card)
    @cards << card
  end

  def cards
    # @cards.each do |card|
    #   puts card.show_card
    # end
    # print @cards
    # @cards.map(&:show_card)
  end

  def score
    score = 0
    @cards.each do |card|
      score += card.face_value 
      if score <= 11 && card.ace?
        score += 10
      end 
    end
    score 
  end

  def busted?
    score > 21
  end

  def output_cards 
    puts "#{@name} score #{score}."
    puts cards
  end
end


# ***************************************
class Game
  def initialize(deck)
    @deck = deck
  end

  def player_hand
    @player_hand
  end

 def dealer_hand
    @dealer_hand
  end

  def deal
    @deck.build_deck
    @player_hand = Hand.new('player')
    @player_hand.hit(@deck.pop)
    @player_hand.hit(@deck.pop)
    @player_hand.output_cards
    deal_dealer
    prompt_player
  end

  def deal_dealer
    @dealer_hand = Hand.new('dealer')
    @dealer_hand.hit(@deck.pop)
    @dealer_hand.hit(@deck.pop)
    puts "Dealer score #{@dealer_hand.score}."
  end

  def prompt_player
    puts "Do you want to hit or stand (H/S)?"
    choice = gets.chomp.downcase
    while !/[hs]/.match(choice)
      puts "Please enter H or S"
      choice=gets.chomp
    end
    hit_or_stand(choice)
  end

  def hit_or_stand(choice)
    while choice.match("h") && @player_hand.score <= 21
      @player_hand.hit(@deck.pop)
      puts "Player score is: #{@player_hand.score}"
      if !@player_hand.busted?
        prompt_player 
      end
    end
    if choice.match("s")
      puts "Okay. Dealer's turn."
    end
  end 
end

game = Game.new(Deck.new)
puts game.deal
# puts game.player_hand.cards.inspect
puts "player cards;"
puts game.player_hand.cards.inspect
puts "dealer cards;"
puts game.dealer_hand.cards.inspect


