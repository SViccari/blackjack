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
    value = card.chop
  if ["J", "Q", "K"].include?(value)
     @total += 10
  elsif value == "A" 
    @total +=1 
  else
    @total += value.to_i
  end
end
puts "Player score is: #{@total}"
end

def validate_answer
  @input = gets.chomp
  while !/[hs]/.match (@input.downcase)
    puts "Please enter H or S"
    @input=gets.chomp
  end
  @input
end

def hit_or_stand
  while @input.match ("h")
    deal_player
    puts calculate_player_score
      if @total > 21
        puts "You loose!!!!!!! HOUSE WINS!"
        break
      elsif
        print "Do you want to hit or stand (H/S):"
        validate_answer
      end
  until @input.match ("s")
    break
  end 
  end
end






puts "Welcome to Blackjack!"
@deck = build_deck
@player_hand = []
@dealer_hand = []

deal_player
deal_player
puts calculate_player_score

print "Do you want to hit or stand (H/S):"

validate_answer
hit_or_stand


#deal_dealer
# deal_dealer
# calculater_dealer_score









# def hit_or_stand 
#   input = gets.chomp
#     while input.downcase == "h"
#       deal_player
#       print calculate_player_score

#   else 
#     reprint score
#     puts "OK standing.."
#   end
# end

#   deal dealer



#Jack, Queen, King = 10pts
#Ace = 1 or 11 points
#player is dealt first
#player can continue playing until they hit 21 or higher
#player can choose to stand
#dealer begins playing after the player chooses to stand
#dealer can stand
#dealer can play unless they have 17...21

#if player goes over 21, dealer wins
#if dealer goes over 21, player wins
#person with a sum closest to 21 wins
#if player sum == dealer sum, no one wins


# *****Method********
# def display_score
# 	puts calculate_score
# end
# **********************

# *****Method********
# def hit_or_stand(calculate_score)
# 	if calculate_score < 21 
#     puts "Do you want to Hit or Stand (H/S)?:"
# end
# **********************

# input = gets.chomp

# *****Method********
# def validate_input
#  validate if user entered H/S or h/s?
#  if not, prompt user to press H or S. 
# end
# **********************


# *****Method********
# def hit
# if input == "h" || "H"
# 	call Method Deal
# 	call Method calculate_score
# 	call display_score
# **********************

# *****Method********
# def store_player_hand
# 	player_hand = []
# 	player_hand << deck.pop
# end
# **********************


# *****Method********
# def stand
# 	if input == "s" || "S"
# 	puts "Okay. Standing."
# end
# **********************

# 
# swith to dealer and add card(s) until card value >= 17
# call deal method
# call store_dealer_hand method
# call deal method
# call store_dealer_hand method
# call calculate_score method
# call stand method 
# 
# 
# # *****Method********
# # def store_dealer_hand
# #   dealer_hand = []
# #   dealer_hand << deck.pop
# # end
# # *********************
# 
# *****Method******** ???Boolean Value? 
# def stand(dealer_score)
#   if dealer calculate score >= 17
#     puts "Dealer is done."
#   else
#     puts "Dealer will hit."
# end
# **********************
# 
# 
# # *****Method********
# def bust(score)
# 	is score > 21
# 	puts "Sorry! You busted."
# end
# **********************


# *****Method********
# def winner(player_score,dealer_score) 
# 	if player calculated score > dealer calculated score
#     puts "You win!"
# # elsif player calculated socre == dealer calculated score
	  # puts "Its a tie!"
	#else
# 	  puts "Dealer wins!"
# end
# **********************





# *****Method********
# def dealer_hit
# 	receive a new card until unless score >= 17
# 	if over 21
# 		puts "Bust! You win!"
# end
# **********************
#
