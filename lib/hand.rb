# -*- coding: utf-8 -*-

require_relative 'deck'

class Hand

	CARD_ORDER = [
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace
	]

  VALUE_RANKS = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }


	attr_accessor :cards

	def initialize(cards)
		@cards = cards
	end

	def count
		@cards.size
	end

	def suit_counts
		counts = Hash.new(0)
		@cards.each do |card|
			counts[card.suit] += 1
		end
		counts
	end

	def value_counts
		counts = Hash.new(0)
		@cards.each do |card|
			counts[card.value] += 1
		end
		counts
	end

	def order!
		@cards.sort_by! do |card|
			VALUE_RANKS[card.value]
		end
	end


	def straight?
		#assumes hand is ordered
 	 	values = @cards.map {|card| card.value}
		# check for low-ace straight
		return true if values == [:ace] + CARD_ORDER[0..3]

		i = 0
		# CARD_ORDER
		while i + 5 <= 13
			if values == CARD_ORDER[i..i+4]
				return true
			end
			i += 1
		end
		false
	end

end
