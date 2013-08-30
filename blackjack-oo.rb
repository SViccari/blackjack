require 'pry'
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
    @card_deck.shuffle
  end

  def pop
    @card_deck.pop
  end
end

class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

class Hand
  attr_reader :score, :cards
  def initialize(name)
    @cards = []
    @name = name
  end
  def hit(card)
    @cards << card
  end

  def stay
  end

  def score
    new_score = 0
    @cards.each do |card|
      new_score += card.value.to_i

  # binding.pry 

    end
    new_score 
  end

  def busted?
  end
end



class Game
  def initialize(deck)
    @deck = deck
  end

  def player_hand
    @player_hand
  end

  def deal
    @deck.build_deck
    @player_hand = Hand.new('player')
    @dealer_hand = Hand.new('dealer')
    @player_hand.hit(@deck.pop)
    @player_hand.hit(@deck.pop)
  end
end

game = Game.new(Deck.new)
game.deal
puts game.player_hand.cards.inspect

