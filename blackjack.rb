#!/usr/bin/env ruby
# encoding: UTF-8

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
	deck = []

	SUITS.each do |suit|
		VALUES.each do |value|
			deck.push(value + suit)
		end
	end
	deck.shuffle
end

def deal_player
  @card_dealt = @deck.pop
  @player_hand << @card_dealt
  puts "Player was dealt #{@card_dealt}."
end

def deal_dealer
  @card_dealt = @deck.pop
  @dealer_hand << @card_dealt
  puts "Dealer was dealt #{@card_dealt}."
end

def calculate_player_score
  @total = 0
  @player_hand.each do |card|
    player_value = card.chop
    if ["J", "Q", "K"].include?(player_value)
      @total += 10
    elsif player_value.include?('A') && @total < 11
      @total += 11
    elsif player_value.include?('A') && @total >= 11
      @total += 1
    else
      @total += player_value.to_i
    end
  end
end

def calculate_dealer_score
  @dealer_total = 0
  @dealer_hand.each do |card|
  value = card.chop
    if ["J", "Q", "K"].include?(value)
      @dealer_total += 10
    elsif value.include?('A') && @dealer_total < 11
      @dealer_total += 11
    elsif value.include?('A') && @dealer_total >= 11
      @dealer_total += 1   
    elsif value == "A" 
      @dealer_total +=1 
    else
      @dealer_total += value.to_i
    end
 end
puts "Dealer score is: #{@dealer_total}"
end


def dealer_turn
  while @dealer_total < 17
    deal_dealer
    puts calculate_dealer_score
  end
      if @dealer_total > 21
        puts "Dealer busted. You win!"
        exit
      else
        puts "Dealer is standing."
      end
end 

def validate_answer
  @input = gets.chomp.downcase
  while !/[hs]/.match(@input)
    puts "Please enter H or S"
    @input=gets.chomp
  end
  @input
end

def hit_or_stand
  while @input.match("h") && @total < 21
    deal_player
    calculate_player_score
    puts "Player score is: #{@total}"
    if @total < 21
      print "Do you want to hit or stand (H/S):"
      validate_answer
    end
 end
      if @total > 21
        @dealer_total = 30
      end
      if @input.match("s")
        puts "Okay. Dealer's turn."
      end
end 

def still_playing
  if @total > 21
  else 
    deal_dealer
    deal_dealer
    calculate_dealer_score
    puts dealer_turn
  end
end

def winner
  if @total == @dealer_total
    puts "It's a tie."
    elsif @total > @dealer_total && @total <= 21
      puts "You win!"
    else 
      puts "House wins! You lose!"
  end
end


puts "Welcome to Blackjack!"
@deck = build_deck
@player_hand = []
@dealer_hand = []

deal_player
deal_player
calculate_player_score

puts "Player score is: #{@total}"

print "Do you want to hit or stand (H/S):"

validate_answer
puts hit_or_stand
still_playing
puts winner



