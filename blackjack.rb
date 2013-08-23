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


puts "Welcome to Blackjack!"
deck = build_deck

puts deck.last

# next_card = deck.pop     #why is it running this? 

# puts next_card


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


# ****Method 1*********
# def Deal
# Two cards are dealt to the player
# End 
# **********************



# *****Method 2********
# def display_score
# 	display the value of each card
# 	sum of current cards
# end
# **********************



# puts "Do you want to Hit or Stand (H/S)?:"
# *****Method 3********
# def correct_choice
# did the user enter H or S?
# if not, remind user to press H or S. 
# end
# **********************



# *****Method 4********
# def player_hit
# 	add card 
# 	calculate new sum
# 	if over 21
# 		puts "Bust! Game over..."
# 		break
# 	end
# **********************


# *****Method 5********
# def stand
# 	display players final score 
# 	end turn
# end
# **********************


# *****Method 6********
# def dealer_hit
# 	receive a new card until unless score >= 17
# 	if over 21
# 		puts "Bust! You win!"
# end
# **********************



















