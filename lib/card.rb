# -*- coding: utf-8 -*-

require_relative 'card_constants'

# Represents a playing card.
class Card

	include CardConstants



	def self.suits
		SUIT_STRINGS.keys
	end

	def self.values
		VALUE_STRINGS.keys
	end

	attr_reader :suit, :value

	def initialize(suit, value)
		@suit, @value = suit, value
	end

	def same_suit?(other_card)
		self.suit == other_card.suit
	end

	def same_value?(other_card)
		self.value == other_card.value
	end

	def same_card?(other_card)
		same_suit?(other_card) && same_value?(other_card)
	end

	def compare(other_card)
		CARD_ORDER.index(self.value) <=> CARD_ORDER.index(other_card.value)
	end
end