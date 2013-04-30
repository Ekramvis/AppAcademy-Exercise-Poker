# -*- coding: utf-8 -*-

require_relative 'deck'
require_relative 'card_constants'

class Hand

	include CardConstants


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

	def values
		@cards.map {|card| card.value}
	end

	def compare(other_hand)
		HAND_RANKS.index(self.hand_value) <=> HAND_RANKS.index(other_hand.hand_value)
	end



	# METHODS TO CHECK HAND TYPES
	# private


	def low_ace_straight?
		vals = self.values
		if vals[-2] == :five && vals[-1] == :ace
			low_ace = vals.unshift(vals.pop)
			if low_ace == [:ace] + CARD_ORDER[0..3]
				return true
			else
				return false
			end
		end
	end

	def straight?
		self.order!

		return true if low_ace_straight?

		i = 0
		# CARD_ORDER
		while i + 5 <= 13
			if self.values == CARD_ORDER[i..i+4]
				return true
			end
			i += 1
		end
		false
	end

	def flush?
		self.suit_counts.values.include?(5)
	end

	def four_kind?
		self.value_counts.values.include?(4)
	end

	def three_kind?
		self.value_counts.values.include?(3)
	end

	def pair?
		self.value_counts.values.include?(2)
	end

	def full_house?
		three_kind? && pair?
	end

	def two_pair?
		pairs = self.value_counts.values.select {|count| count == 2}
		pairs.size == 2
	end


	# switch to check highest value in hand

	def hand_value
		if straight? && flush? && self.values[-1] == :ace
			return :rf
		elsif straight? && flush?
			return :sf
		elsif flush?
			return :fl
		elsif straight?
			return :st
		elsif four_kind?
			return :fk
		elsif full_house?
			return :fh
		elsif three_kind?
			return :tk
		elsif two_pair?
			return :tp
		elsif pair?
			return :op
		else
			return :nh
		end
	end



end
